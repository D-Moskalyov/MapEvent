package com.mapevent.web.service;


import com.mapevent.web.model.Place;

import java.util.List;

public interface PlaceService {
    int saveOrUpdate(Place place);
    int placeAlreadyExist(String plcIDGoogle, String addressLine1, String addressLine2, String city,
                              String state, String country, Double lat, Double lng);
    //List<Place> getPlacesByCoord(double NElat, double NElng, double SWlat, double SWlng);
}
