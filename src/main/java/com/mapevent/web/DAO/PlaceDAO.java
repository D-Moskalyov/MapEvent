package com.mapevent.web.DAO;

import com.mapevent.web.model.Place;
import com.mapevent.web.model.User;
import com.mapevent.web.service.PlaceService;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.List;

@Repository(value = "placeDAO")
@Transactional
public class PlaceDAO implements PlaceService{
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

    public int saveOrUpdate(Place place) {
        sf.getCurrentSession().saveOrUpdate(place);
        return place.getPlcID();
    }

    public int placeAlreadyExist(String plcIDGoogle, String addressLine1, String addressLine2, String city,
                                     String state, String country, Double lat, Double lng) {
        DecimalFormat df = new DecimalFormat("#.######");
        df.setRoundingMode(RoundingMode.CEILING);


        Query q = sf.getCurrentSession().createQuery("from Place p where p.plcIDGoogle = :plcIDGoogle and " +
                                                                        "p.addressLine1 = :addressLine1 and " +
                                                                        "p.addressLine2 = :addressLine2 and " +
                                                                        "p.city = :city and " +
                                                                        "p.state = :state and " +
                                                                        "p.country = :country and " +
                                                                        "p.lat = :lat and " +
                                                                        "p.lng = :lng");
        q.setString("plcIDGoogle", plcIDGoogle);
        q.setString("addressLine1", addressLine1);
        q.setString("addressLine2", addressLine2);
        q.setString("city", city);
        q.setString("state", state);
        q.setString("country", country);
        double dblat = (double)(Math.round(lat * 1000000d) / 1000000d);
        double dblng = (double)(Math.round(lng * 1000000d) / 1000000d);
        q.setDouble("lat", dblat);
        q.setDouble("lng", dblng);

        List<Place> places = q.list();
        if (places.isEmpty()) {
            return 0;
        }
        return places.get(0).getPlcID();
    }

//    public List<Place> getPlacesByCoord(double NElat, double NElng, double SWlat, double SWlng) {
//        Query q = sf.getCurrentSession().createQuery("from Place p where p.lat >= :SWlat and p.lat <= :NElat and " +
//                                                                        "p.lng >= :SWlng and p.lng <= :NElng");
//
//        q.setDouble("SWlat", SWlat);
//        q.setDouble("NElat", NElat);
//        q.setDouble("SWlng", SWlng);
//        q.setDouble("NElng", NElng);
//
//        List<Place> places = q.list();
//        if (!places.isEmpty()) {
//            return places;
//        }
//
//        return null;
//    }
}
