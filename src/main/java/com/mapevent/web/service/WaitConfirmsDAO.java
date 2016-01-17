package com.mapevent.web.service;

import com.mapevent.web.modelDB.User;
import com.mapevent.web.modelDB.WaitConfirm;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository(value = "waitConfirmsDAO")
@Transactional
public class WaitConfirmsDAO implements WaitConfirmsService{
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

    @Autowired
    UserService userService;

    public int save(WaitConfirm wtC) {
        return (Integer) sf.getCurrentSession().save(wtC);
    }

    public User checkCode(String code) {
        User user = new User();
        Query q = sf.getCurrentSession().createQuery("from WaitConfirm wtC where wtC.hashConfirm = :code");
        q.setString("code", code);
        List<WaitConfirm> waitConfirms = q.list();
        if (waitConfirms != null & waitConfirms.size() > 0) {
            Date sendDate = waitConfirms.get(0).getSend_Email();
            Date nowDate = new Date();
            if((nowDate.getTime() - sendDate.getTime()) > 86400000){
                return user;
            }
            user = new User(waitConfirms.get(0).getEmail(), true, waitConfirms.get(0).getFullName(),
                    waitConfirms.get(0).getGender(), waitConfirms.get(0).getPassword(), waitConfirms.get(0).getUserName());

            sf.getCurrentSession().delete(waitConfirms.get(0));

            return user;
        }
        return user;
    }

    public boolean userAlreadyExist(String user) {
        Query q = sf.getCurrentSession().createQuery("from WaitConfirm wtC where wtC.userName = :userName");
        q.setString("userName", user);
        List<User> users = q.list();
        if (users.isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean emailAlreadyExist(String email) {
        Query q = sf.getCurrentSession().createQuery("from WaitConfirm wtC where wtC.email = :email");
        q.setString("email", email);
        List<User> users = q.list();
        if (users.isEmpty()) {
            return false;
        }
        return true;
    }
}
