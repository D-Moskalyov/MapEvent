package com.mapevent.web.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "events")
public class Event {
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

    @Column(name = "Have_Imgs", nullable = false, columnDefinition = "boolean default false")
    private boolean haveImgs;

    @Column(name = "Start")
    private Date start;

    @Column(name = "Finish")
    private Date finish;

    @Column(name = "Discription")
    private String discription;

//    @ManyToOne(mappedBy = "events")
//    List<Place> events;
}
