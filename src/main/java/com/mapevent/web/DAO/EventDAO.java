package com.mapevent.web.DAO;

import com.mapevent.web.model.MyEvent;
import com.mapevent.web.model.User;
import com.mapevent.web.service.EventService;
import com.mapevent.web.utils.EventNotExistException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "eventDAO")
@Transactional
public class EventDAO implements EventService {
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

//    @Autowired
//    PlaceService placeService;

    public int save(MyEvent myEvent) {
        return (Integer) sf.getCurrentSession().save(myEvent);
    }

    public MyEvent getEventByID(int id) throws EventNotExistException {
        Query q = sf.getCurrentSession().createQuery("from MyEvent e where e.evID = :id");
        q.setInteger("id", id);
        List<MyEvent> myEvents = q.list();
        if (!myEvents.isEmpty()) {
            return myEvents.get(0);
        }
        else {
            throw new EventNotExistException();
        }
    }
}
