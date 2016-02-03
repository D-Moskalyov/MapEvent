package com.mapevent.web.service;

import com.mapevent.web.exceptions.UserWithoutEvents;
import com.mapevent.web.model.Favorite;

public interface FavoriteService {
    int save(Favorite favorite);
    void delete(Favorite favorite);
    Favorite getPair(int uID, int evID) throws UserWithoutEvents;
}
