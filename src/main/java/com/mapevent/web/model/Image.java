package com.mapevent.web.model;

import javax.persistence.*;

@Entity
@Table(name = "images")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Emg_Id")
    private Integer imgID;

    @Column(name = "Ev_Id")
    private int evID;

    @Column(name = "Address_Img")
    private String address;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "Ev_Id", insertable = false, updatable = false)
    public MyEvent event;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public MyEvent getEvent() {
        return event;
    }

    public void setEvent(MyEvent event) {
        this.event = event;
    }

    public int getEvID() {
        return evID;
    }

    public void setEvID(int evID) {
        this.evID = evID;
    }

    public Integer getImgID() {
        return imgID;
    }

    public void setImgID(Integer imgID) {
        this.imgID = imgID;
    }
}
