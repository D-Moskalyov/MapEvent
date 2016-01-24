package com.mapevent.web.service;


import com.mapevent.web.model.User;
import com.mapevent.web.model.WaitConfirm;

public interface WaitConfirmsService {
    int save(WaitConfirm wtC);
    User checkCode(String code);
    boolean userAlreadyExist(String username);
    boolean emailAlreadyExist(String email);
}
