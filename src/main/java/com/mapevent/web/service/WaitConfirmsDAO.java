package com.mapevent.web.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository(value = "waitConfirmsDAO")
@Transactional
public class WaitConfirmsDAO implements WaitConfirmsService{
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

    public boolean checkCode(String code) {
        return false;
    }
}
