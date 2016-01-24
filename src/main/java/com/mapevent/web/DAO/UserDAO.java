package com.mapevent.web.DAO;

import com.mapevent.web.model.User;
import com.mapevent.web.service.UserService;
import com.mapevent.web.utils.MD5;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.*;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "userDAO")
@Transactional
public class UserDAO implements UserService {
    @Autowired
    @Qualifier(value = "authMgr")
    AuthenticationManager authMgr;

    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

    public boolean authenticateUser(UserDetails userDetails, String remember) {
        AbstractAuthenticationToken auth;
        if(remember.equals("off")) {
            auth = new UsernamePasswordAuthenticationToken(userDetails,
                    userDetails.getPassword(), userDetails.getAuthorities());
        }
        else{
            auth = new RememberMeAuthenticationToken("com.mapevent.web",
                    userDetails, userDetails.getAuthorities());
        }

        authMgr.authenticate(auth);
        if(auth.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(auth);
//            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//            if(authentication != null){
//                if(authentication instanceof RememberMeAuthenticationToken){
//                    authentication = null;
//                }
//            }
            return true;
        }
        return false;
    }

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        //try {
            Query q = sf.getCurrentSession().createQuery("from User u where u.userName = :userName");
            q.setString("userName", s);
            List<User> users = q.list();
            if (users.isEmpty()) {
                q = sf.getCurrentSession().createQuery("from User u where u.email = :email");
                q.setString("email", s);
                users = q.list();
                if (users.isEmpty()) {
                    throw new UsernameNotFoundException("User or email " + s + " not found");
                }
                else
                    return users.get(0);
            } else
                return users.get(0);
        //} catch (Exception e) {
            //System.err.println("ohshit");
        //}
        //return null;
    }

    public boolean save(User user){
        sf.getCurrentSession().save(user);
        return true;
    }

    public boolean userAlreadyExist(String username){
        Query q = sf.getCurrentSession().createQuery("from User u where u.userName = :userName");
        q.setString("userName", username);
        List<User> users = q.list();
        if (users.isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean emailAlreadyExist(String email){
        Query q = sf.getCurrentSession().createQuery("from User u where u.email = :email");
        q.setString("email", email);
        List<User> users = q.list();
        if (users.isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean updateUserPassword(String email, String pass) {
        Query q = sf.getCurrentSession().createQuery("from User u where u.email = :email");
        q.setString("email", email);
        List<User> users = q.list();
        if (!users.isEmpty()) {
            User user = users.get(0);
            user.setPassword(MD5.getHash(pass));
            sf.getCurrentSession().update(user);
            return true;
        }
        return false;
    }
}
