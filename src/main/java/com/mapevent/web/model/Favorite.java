package com.mapevent.web.model;

import javax.persistence.*;

@Entity
@Table(name = "favorites")
public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "F_Id")
    private Integer fID;

    @Column(name = "U_Id")
    private int uID;

    @Column(name = "Ev_Id")
    private int evID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Ev_Id", insertable = false, updatable = false)
    //@JoinColumn(name = "evID", nullable = false)
    public MyEvent event;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "U_Id", insertable = false, updatable = false)
    public User user;

    public int getEvID() {
        return evID;
    }

    public void setEvID(int evID) {
        this.evID = evID;
    }

    public Integer getfID() {
        return fID;
    }

    public void setfID(Integer fID) {
        this.fID = fID;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }


    public MyEvent getEvent() {
        return event;
    }

    public void setEvent(MyEvent event) {
        this.event = event;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
