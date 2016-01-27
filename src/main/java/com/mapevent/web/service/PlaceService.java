package com.mapevent.web.service;


import com.mapevent.web.model.Place;

public interface PlaceService {
    int saveOrUpdate(Place place);
    int placeAlreadyExist(String plcIDGoogle, String addressLine1, String addressLine2, String city,
                              String state, String country, Double lat, Double lng);
}
