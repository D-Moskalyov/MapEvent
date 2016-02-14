package com.mapevent.web.DTO;


import com.mapevent.web.model.MyEvent;

public class EventWithTags {

    public EventWithTags(MyEvent mE, boolean isF, boolean isMyE){
        event = mE;
        favorite = isF;
        myEvent = isMyE;
    }

    boolean favorite;
    boolean myEvent;

    MyEvent event;

    public MyEvent getEvent() {
        return event;
    }

    public void setEvent(MyEvent event) {
        this.event = event;
    }

    public boolean isFavorite() {
        return favorite;
    }

    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }

    public boolean isMyEvent() {
        return myEvent;
    }

    public void setMyEvent(boolean myEvent) {
        this.myEvent = myEvent;
    }
}
