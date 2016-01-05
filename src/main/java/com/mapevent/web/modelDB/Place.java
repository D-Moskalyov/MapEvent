package com.mapevent.web.modelDB;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "places")
public class Place {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Plc_Id")
    private Integer plcID;

    @Column(name = "Address_Line_1")
    private String addressLine1;

    @Column(name = "Address_Line_2")
    private String AddressLine2;

    @Column(name = "City")
    private String city;

    @Column(name = "State")
    private String state;

    @Column(name = "Country")
    private String country;

    @Column(name = "Lat")
    private double lat;

    @Column(name = "Lng")
    private double lng;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "place")
    List<Event> events;
}
