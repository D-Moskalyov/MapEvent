package com.mapevent.web.service;


import com.mapevent.web.model.MyEvent;
import com.mapevent.web.utils.EventNotExistException;

public interface EventService {
    int save(MyEvent myEvent);
    MyEvent getEventByID(int id) throws EventNotExistException;
}
