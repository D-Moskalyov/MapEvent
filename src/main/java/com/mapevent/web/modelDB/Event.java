package com.mapevent.web.modelDB;

import javax.persistence.*;
import java.util.Date;

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

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "plcID", nullable = false)
    Place place;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "uID", nullable = false)
    User user;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "catID", nullable = false)
    Category category;
}
