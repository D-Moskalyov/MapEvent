package com.mapevent.web.DAO;

import com.mapevent.web.model.MyEvent;
import com.mapevent.web.service.EventService;
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

    public int save(MyEvent myEvent) {
        return (Integer) sf.getCurrentSession().save(myEvent);
    }
}