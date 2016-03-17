package com.mapevent.web.DTO;

import java.util.Date;

public class EventForMarkerPopup {
    int evID;
    String title;
    String category;
    String startDate;
    String finishDate;
    String owner;
    String img;
    boolean isMyFavorite;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getEvID() {
        return evID;
    }

    public void setEvID(int evID) {
        this.evID = evID;
    }

    public String getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(String finishDate) {
        this.finishDate = finishDate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public boolean isMyFavorite() {
        return isMyFavorite;
    }

    public void setIsMyFavorite(boolean isMyFavorite) {
        this.isMyFavorite = isMyFavorite;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
