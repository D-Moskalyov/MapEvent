package com.mapevent.web.model;


import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewEventForm {
    //@NotEmpty(message = "������� ���������")
    //@Size(min = 5, message = "��������� ������ �������� �� ����� ��� �� 5 ��������")
    private String what;

    @NotEmpty(message = "�������� ���������")
    private String category;

    //@NotEmpty(message = "�������� ������ �����")
    private String street_number;
    //@NotEmpty(message = "�������� ������ �����")
    private String route;
    //@NotEmpty(message = "�������� ������ �����")
    private String locality;
    //@NotEmpty(message = "�������� ������ �����")
    private String administrative_area_level_1;
    //@NotEmpty(message = "�������� ������ �����")
    private String country;
    //@NotEmpty(message = "�������� ������ �����")
    private String lat;
    //@NotEmpty(message = "�������� ������ �����")
    private String lng;
    //@NotEmpty(message = "�������� ������ �����")
    private String placeID;

    //@NotEmpty(message = "���������� ���� � ����� ������ �������")
    private String whenStart;

    //@NotEmpty(message = "���������� ���� � ����� ��������� �������")
    private String whenFinish;

    //@NotEmpty(message = "������� ������� ��������")
    //@Size(min = 5, message = "�� ����� ���� ��������")
    private String description;

    public NewEventForm() {
        this.administrative_area_level_1 = "";
        this.country = "";
        this.category = "";
        this.description = "";
        this.locality = "";
        this.route = "";
        this.street_number = "";
        this.what = "";
        this.whenFinish = "";
        this.whenStart = "";
        this.lat = "";
        this.lng = "";
        this.placeID = "";
    }

    @AssertTrue(message="��������� ���������")
    public boolean isValidTitle() {
        if(what.length() > 5)
            return true;
        return false;
    }

    @AssertTrue(message="��������� ����")
    public boolean isValidDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm a");
        Date nowDate = new Date();
        formatter.format(nowDate);
        Date today = new Date(nowDate.getYear(), nowDate.getMonth(), nowDate.getDate(),
                nowDate.getHours(), nowDate.getMinutes());

        try {
            Date st = new Date();
            formatter.format(st);
            st = formatter.parse(whenStart);

            Date fin = new Date();
            formatter.format(fin);
            fin = formatter.parse(whenFinish);

            if(fin.after(st)){
                return st.after(today);
            }
            return false;
        } catch (ParseException e) {
            e.printStackTrace();
            return false;
        }
    }

    @AssertTrue(message="�������� �����")
    public boolean isValidAddress() {
        if(street_number != "" & route != "" & locality != "" & administrative_area_level_1 != ""
                & country != "" & lat != "" & lng != "" & placeID != "")
            return true;
        return false;
    }

    @AssertTrue(message="��������� ��������")
    public boolean isValidDest() {
        if(description.length() > 5)
            return true;
        return false;
    }


    public String getAdministrative_area_level_1() {
        return administrative_area_level_1;
    }

    public void setAdministrative_area_level_1(String administrative_area_level_1) {
        this.administrative_area_level_1 = administrative_area_level_1;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getStreet_number() {
        return street_number;
    }

    public void setStreet_number(String street_number) {
        this.street_number = street_number;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getPlaceID() {
        return placeID;
    }

    public void setPlaceID(String placeID) {
        this.placeID = placeID;
    }

    public String getWhat() {
        return what;
    }

    public void setWhat(String what) {
        this.what = what;
    }

    public String getWhenFinish() {
        return whenFinish;
    }

    public void setWhenFinish(String whenFinish) {
        this.whenFinish = whenFinish;
    }

    public String getWhenStart() {
        return whenStart;
    }

    public void setWhenStart(String whenStart) {
        this.whenStart = whenStart;
    }

}
