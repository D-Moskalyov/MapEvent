package com.mapevent.web.DAO;

import com.mapevent.web.model.Event;
import com.mapevent.web.service.EventService;
import com.mapevent.web.service.PlaceService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository(value = "eventDAO")
@Transactional
public class EventDAO implements EventService{
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

//    @Autowired
//    PlaceService placeService;

    public int save(Event event) {
        return (Integer) sf.getCurrentSession().save(event);
    }
}
