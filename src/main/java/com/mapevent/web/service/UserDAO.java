package com.mapevent.web.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository(value = "userDAO")
@Transactional
public class UserDAO implements UserService, UserDetailsService {
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return null;
    }
}
