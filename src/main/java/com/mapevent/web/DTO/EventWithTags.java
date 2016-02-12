package com.mapevent.web.DTO;


import com.mapevent.web.model.MyEvent;

public class EventWithTags {

    public EventWithTags(MyEvent mE, boolean isF, boolean isMyE){
        event = mE;
        isFavorite = isF;
        isMyEvent = isMyE;
    }

    boolean isFavorite;
    boolean isMyEvent;

    MyEvent event;

    public MyEvent getEvent() {
        return event;
    }

    public void setEvent(MyEvent event) {
        this.event = event;
    }

    public boolean isFavorite() {
        return isFavorite;
    }

    public void setIsFavorite(boolean isFavorite) {
        this.isFavorite = isFavorite;
    }

    public boolean isMyEvent() {
        return isMyEvent;
    }

    public void setIsMyEvent(boolean isMyEvent) {
        this.isMyEvent = isMyEvent;
    }
}
