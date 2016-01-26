package com.mapevent.web.DAO;

import com.mapevent.web.model.Category;
import com.mapevent.web.model.User;
import com.mapevent.web.service.CategoryService;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "categoryDAO")
@Transactional
public class CategoryDAO implements CategoryService{

    @Autowired
    @Qualifier(value = "sessionFactory")
    SessionFactory sf;

    public int getCatID(String title) {
        Query q = sf.getCurrentSession().createQuery("from Category c where c.title = :title");
        q.setString("title", title);
        List<Category> categories = q.list();
        if (!categories.isEmpty()) {
            return categories.get(0).getCatID();
        }
        return 0;
    }
}
