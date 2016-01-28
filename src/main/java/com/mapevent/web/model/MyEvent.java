package com.mapevent.web.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "events")
public class MyEvent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Ev_Id")
    private Integer evID;

    @Column(name = "U_Id")
    private int uID;

    @Column(name = "Cat_Id")
    private int catID;

    @Column(name = "Plc_Id")
    private int plcID;

    @Column(name = "Title")
    private String title;

    @Column(name = "Have_Imgs", nullable = false, columnDefinition = "boolean default false")
    private boolean haveImgs;

    @Column(name = "Start")
    private Date start;

    @Column(name = "Finish")
    private Date finish;

    @Column(name = "Discription")
    private String discription;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "plcID", nullable = false)
    public Place place;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "uID", nullable = false)
    public User user;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "catID", nullable = false)
    Category category;

    public boolean isHaveImgs() {
        return haveImgs;
    }

    public void setHaveImgs(boolean haveImgs) {
        this.haveImgs = haveImgs;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getCatID() {
        return catID;
        //return  category.getCatID();
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public Integer getEvID() {
        return evID;
    }

    public void setEvID(Integer evID) {
        this.evID = evID;
    }

    public Date getFinish() {
        return finish;
    }

    public void setFinish(Date finish) {
        this.finish = finish;
    }

    public Place getPlace() {
        return place;
    }

    public void setPlace(Place place) {
        this.place = place;
    }

    public int getPlcID() {
        return plcID;
        //return place.getPlcID();
    }

    public void setPlcID(int plcID) {
        this.plcID = plcID;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getuID() {
        return uID;
        //return user.getuID();
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
