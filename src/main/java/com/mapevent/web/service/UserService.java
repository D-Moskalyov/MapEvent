package com.mapevent.web.service;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    boolean authenticateUser(UserDetails userDetails, String remember);
}
