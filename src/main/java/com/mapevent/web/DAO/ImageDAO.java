package com.mapevent.web.DAO;

import com.mapevent.web.service.ImageService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository(value = "ImageDAO")
@Transactional
public class ImageDAO implements ImageService{
    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

}
