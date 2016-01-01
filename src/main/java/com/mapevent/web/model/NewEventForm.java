package com.mapevent.web.model;


import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewEventForm {
    @NotEmpty(message = "Введите заголовок")
    @Size(min = 5, message = "Заголовок должен состаять не менее чем из 5 символов")
    private String what;

    @NotEmpty(message = "Выберите категорию")
    private String category;

    @NotEmpty(message = "Выберите точный адрес")
    private String street_number;
    @NotEmpty(message = "Выберите точный адрес")
    private String route;
    @NotEmpty(message = "Выберите точный адрес")
    private String locality;
    @NotEmpty(message = "Выберите точный адрес")
    private String administrative_area_level_1;
    @NotEmpty(message = "Выберите точный адрес")
    private String country;

    @NotEmpty(message = "Установите дату и время начала события")
    private String whenStart;

    @NotEmpty(message = "Установите дату и время окончания события")
    private String whenFinish;

    @AssertTrue(message="Проверьте даты")
    private boolean isValid() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm a");
        Date nowDate = new Date();
        Date today = new Date(nowDate.getYear(), nowDate.getMonth(), nowDate.getDate(),
                nowDate.getHours(), nowDate.getMinutes());
        try {
            Date st = formatter.parse(whenStart);
            Date fin = formatter.parse(whenFinish);
            return fin.after(st) & today.before(st);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }

    @NotEmpty(message = "Введите краткое описание")
    @Size(min = 5, message = "Не менее пяти символов")
    private String description;

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
