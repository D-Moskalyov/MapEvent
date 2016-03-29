package com.mapevent.web.DTO;


import com.mapevent.web.utils.DateTimeFormatter;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.AssertTrue;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class NewEventForm {

    private int id;
    //@NotEmpty(message = "Введите заголовок")
    //@Size(min = 5, message = "Заголовок должен состаять не менее чем из 5 символов")
    private String what;

    @NotEmpty(message = "Выберите категорию")
    private String category;

    //@NotEmpty(message = "Выберите точный адрес")
    private String street_number;
    //@NotEmpty(message = "Выберите точный адрес")
    private String route;
    //@NotEmpty(message = "Выберите точный адрес")
    private String locality;
    //@NotEmpty(message = "Выберите точный адрес")
    private String administrative_area_level_1;
    //@NotEmpty(message = "Выберите точный адрес")
    private String country;
    //@NotEmpty(message = "Выберите точный адрес")
    private String lat;
    //@NotEmpty(message = "Выберите точный адрес")
    private String lng;
    //@NotEmpty(message = "Выберите точный адрес")
    private String placeID;

    //@NotEmpty(message = "Установите дату и время начала события")
    private String whenStart;

    //@NotEmpty(message = "Установите дату и время окончания события")
    private String whenFinish;

    //@NotEmpty(message = "Введите краткое описание")
    //@Size(min = 5, message = "Не менее пяти символов")
    private String description;

    private MultipartFile imageCover;

    private List<MultipartFile> imagesList;

    private boolean edit;

    public boolean isEdit() {
        return edit;
    }

    public void setEdit(boolean edit) {
        this.edit = edit;
    }

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

    @AssertTrue(message="Проверьте заголовок")
    public boolean isValidTitle() {
        if(what.length() > 5)
            return true;
        return false;
    }

    @AssertTrue(message="Проверьте даты")
    public boolean isValidDate() {
//        if(whenStart != "")
//            whenStart = DateTimeFormatter.Format(whenStart);
//        if(whenFinish != "")
//            whenFinish = DateTimeFormatter.Format(whenFinish);
        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
        Date nowDate = new Date();
        formatter.format(nowDate);
        Date today = new Date(nowDate.getYear(), nowDate.getMonth(), nowDate.getDate(),
                nowDate.getHours(), nowDate.getMinutes());

        try {
            Date st = new Date();
            formatter.format(st);
            if(whenStart != "")
                st = formatter.parse(DateTimeFormatter.Format(whenStart));
            else
                return false;

            Date fin = new Date();
            formatter.format(fin);
            if(whenFinish != "")
                fin = formatter.parse(DateTimeFormatter.Format(whenFinish));
            else
                return false;

            if(fin.after(st)){
                return st.after(today);
            }
            return false;
        } catch (ParseException e) {
            e.printStackTrace();
            return false;
        }
    }

    @AssertTrue(message="Выберите адрес")
    public boolean isValidAddress() {
        if(street_number != "" & route != "" & locality != "" & administrative_area_level_1 != ""
                & country != "" & lat != "" & lng != "" & placeID != "")
            return true;
        return false;
    }

    @AssertTrue(message="Проверьте описание")
    public boolean isValidDest() {
        if(description.length() > 5)
            return true;
        return false;
    }

    @AssertTrue(message="Допустимы только картинки")
    public boolean isValidImageCover() {
        if (imageCover != null && !imageCover.getContentType().contains("image"))
            return false;
        return true;
    }

    @AssertTrue(message="Вы можете добавить не более трёх картинок")
    public boolean isValidImegesList() {
        if(imagesList != null && imagesList.size() > 3)
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MultipartFile getImageCover() {
        return imageCover;
    }

    public void setImageCover(MultipartFile imageCover) {
        this.imageCover = imageCover;
    }

    public List<MultipartFile> getImagesList() {
        return imagesList;
    }

    public void setImagesList(List<MultipartFile> imagesList) {
        this.imagesList = imagesList;
    }
}
