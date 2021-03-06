package com.mapevent.web.DAO;

import com.mapevent.web.exceptions.UserWithoutEvents;
import com.mapevent.web.exceptions.UserWithoutFavEvent;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.service.EventService;
import com.mapevent.web.exceptions.EventNotExistException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Repository(value = "eventDAO")
@Transactional
public class EventDAO implements EventService {
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

//    @Autowired
//    PlaceService placeService;

    public int saveOrUpdate(MyEvent myEvent) {
        sf.getCurrentSession().saveOrUpdate(myEvent);
        return myEvent.getEvID();
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

    public LinkedList<MyEvent> getEventByUserID(int id) throws UserWithoutEvents {
        Query q = sf.getCurrentSession().createQuery("from MyEvent e where e.uID = :id");
        q.setInteger("id", id);
        List<MyEvent> myEvents = q.list();
        LinkedList<MyEvent> myEventLinkedList = new LinkedList<MyEvent>(myEvents);
        if (!myEvents.isEmpty()) {
            return myEventLinkedList;
        }
        else {
            throw new UserWithoutEvents();
        }
    }

    public LinkedList<MyEvent> getFavEventByUserID(int id) throws UserWithoutFavEvent {
        Query q = sf.getCurrentSession().createQuery("select e from MyEvent e join e.favorites f where f.uID = :id");
        q.setInteger("id", id);
        //List<User> users = q.list();
        List<MyEvent> myEvents = q.list();
        LinkedList<MyEvent> myEventLinkedList = new LinkedList<MyEvent>(myEvents);
        if (!myEvents.isEmpty()) {
            return myEventLinkedList;
        }
        else {
            throw new UserWithoutFavEvent();
        }
    }

    public void delete(MyEvent event) {
        sf.getCurrentSession().delete(event);
    }

    public List<MyEvent> getEventForMap(Date start, Date finish, List<Integer> cats, double NElat, double NElng, double SWlat, double SWlng) {
        Query q = sf.getCurrentSession().createQuery(
                "select e from MyEvent e " +
                "join e.place p join e.category c " +
                "where " +
                "(e.start >= :start and e.start <= :finish) " +
                "and " +
                "(p.lat <= :NElat and p.lat >= :SWlat and p.lng <= :NElng and p.lng >= :SWlng) " +
                "and " +
                "(c.catID in (:cats))");

        q.setDouble("SWlat", SWlat);
        q.setDouble("NElat", NElat);
        q.setDouble("SWlng", SWlng);
        q.setDouble("NElng", NElng);
        q.setTimestamp("start", start);
        q.setTimestamp("finish", finish);
        q.setParameterList("cats", cats);

        List<MyEvent> myEvents = q.list();

        return myEvents;
    }
}
