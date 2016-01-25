package com.mapevent.web.DAO;

import com.mapevent.web.service.PlaceService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository(value = "placeDAO")
@Transactional
public class PlaceDAO implements PlaceService{
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;
}
