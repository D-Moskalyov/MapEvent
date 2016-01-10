package com.mapevent.web.service;

import com.mapevent.web.modelDB.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
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

    public boolean authenticateUser(UserDetails userDetails) {
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetails,
                userDetails.getPassword(), userDetails.getAuthorities());
        authMgr.authenticate(auth);
        if(auth.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(auth);
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
                    throw new UsernameNotFoundException("User " + s + " not found");
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
}