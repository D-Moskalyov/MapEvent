package com.mapevent.web.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "places")
public class Place {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Plc_Id")
    private Integer plcID;

    @Column(name = "Plc_Id_Google")
    private String plcIDGoogle;

    @Column(name = "Address_Line_1")
    private String addressLine1;

    @Column(name = "Address_Line_2")
    private String addressLine2;

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


    @OneToMany(fetch = FetchType.LAZY)
    List<MyEvent> myEvents;

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public List<MyEvent> getMyEvents() {
        return myEvents;
    }

    public void setMyEvents(List<MyEvent> myEvents) {
        this.myEvents = myEvents;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public Integer getPlcID() {
        return plcID;
    }

    public void setPlcID(Integer plcID) {
        this.plcID = plcID;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPlcIDGoogle() {
        return plcIDGoogle;
    }

    public void setPlcIDGoogle(String plcIDGoogle) {
        this.plcIDGoogle = plcIDGoogle;
    }
}
