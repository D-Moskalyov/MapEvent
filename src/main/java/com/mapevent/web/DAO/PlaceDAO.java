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
        q.setDouble("lat", Double.parseDouble(df.format(lat)));
        q.setDouble("lng", Double.parseDouble(df.format(lng)));

        List<Place> places = q.list();
        if (places.isEmpty()) {
            return 0;
        }
        return places.get(0).getPlcID();
    }
}
