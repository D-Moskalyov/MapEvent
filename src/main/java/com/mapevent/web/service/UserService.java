package com.mapevent.web.service;


import com.mapevent.web.model.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    boolean authenticateUser(UserDetails userDetails, String remember);
    boolean save(User user);
    boolean userAlreadyExist(String username);
    boolean emailAlreadyExist(String email);
    boolean updateUserPassword(String email, String pass);
}
