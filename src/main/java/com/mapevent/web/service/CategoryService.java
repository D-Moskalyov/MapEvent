package com.mapevent.web.service;


import com.mapevent.web.model.Category;

import java.util.List;

public interface CategoryService {
    int getCatID(String titleCat);
    List<Category> getCategoryList();
}
