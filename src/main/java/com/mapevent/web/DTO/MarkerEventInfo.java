package com.mapevent.web.DTO;

public class MarkerEventInfo {
    int evID;
    double lat;
    double lng;
    String img;
    String category;

    public  MarkerEventInfo(int evID, double lat, double lng, String img, String category){
        this.evID = evID;
        this.lat = lat;
        this.lng = lng;
        this.img = img;
        this.category = category;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
