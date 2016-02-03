package com.mapevent.web.service;


import com.mapevent.web.exceptions.UserWithoutEvents;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.exceptions.EventNotExistException;

import java.util.List;

public interface EventService {
    int save(MyEvent myEvent);
    MyEvent getEventByID(int id) throws EventNotExistException;
    List<MyEvent> getEventByUserID(int id) throws UserWithoutEvents;
    List<MyEvent> getFavEventByUserID(int id) throws UserWithoutEvents;
}
