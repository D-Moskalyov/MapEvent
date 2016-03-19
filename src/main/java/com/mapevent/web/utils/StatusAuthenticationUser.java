package com.mapevent.web.utils;


import com.mapevent.web.model.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class StatusAuthenticationUser {

    public static User getAuthenticationUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object user = (Object) authentication.getPrincipal();
            if (user.getClass() == User.class) {
                return (User) user;
            }
        }
        return null;
    }
}
