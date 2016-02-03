package com.mapevent.web.DAO;

import com.mapevent.web.exceptions.UserWithoutEvents;
import com.mapevent.web.model.Favorite;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.service.FavoriteService;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "favoriteDAO")
@Transactional
public class FavoriteDAO implements FavoriteService{
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

    public void delete(Favorite favorite) {
        sf.getCurrentSession().delete(favorite);
    }

    public Favorite getPair(int uID, int evID) throws UserWithoutEvents {
        Query q = sf.getCurrentSession().createQuery("from Favorite f where f.uID = :uID and f.evID = :evID");
        q.setInteger("uID", uID);
        q.setInteger("evID", evID);
        List<Favorite> favorites = q.list();
        if (!favorites.isEmpty()) {
            return favorites.get(0);
        }
        else {
            throw new UserWithoutEvents();
        }
    }

    public int save(Favorite favorite) {
        try {
            getPair(favorite.getuID(), favorite.getEvID());
            return 0;
        } catch (UserWithoutEvents userWithoutEvents) {
            userWithoutEvents.printStackTrace();
            return (Integer) sf.getCurrentSession().save(favorite);
        }
    }
}
