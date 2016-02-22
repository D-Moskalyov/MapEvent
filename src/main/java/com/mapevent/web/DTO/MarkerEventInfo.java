package com.mapevent.web.DTO;

public class MarkerEventInfo {
    int evID;
    double lat;
    double lng;
    String img;

    public  MarkerEventInfo(int evID, double lat, double lng, String img){
        this.evID = evID;
        this.lat = lat;
        this.lng = lng;
        this.img = img;
    }

    public int getEvID() {
        return evID;
    }

    public void setEvID(int evID) {
        this.evID = evID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }
}
