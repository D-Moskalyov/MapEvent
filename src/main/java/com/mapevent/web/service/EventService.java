package com.mapevent.web.service;


import com.mapevent.web.exceptions.UserWithoutEvents;
import com.mapevent.web.exceptions.UserWithoutFavEvent;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.exceptions.EventNotExistException;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public interface EventService {
    int saveOrUpdate(MyEvent myEvent);
    MyEvent getEventByID(int id) throws EventNotExistException;
    LinkedList<MyEvent> getEventByUserID(int id) throws UserWithoutEvents;
    LinkedList<MyEvent> getFavEventByUserID(int id) throws UserWithoutFavEvent;
    void delete(MyEvent event);
    List<MyEvent> getEventForMap(Date start, Date finish, List<Integer> cats, double NElat, double NElng, double SWlat, double SWlng);
}
