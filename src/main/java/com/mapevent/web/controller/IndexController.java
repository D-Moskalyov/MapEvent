package com.mapevent.web.controller;


import com.mapevent.web.model.MyEvent;
import com.mapevent.web.service.CategoryService;
import com.mapevent.web.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    EventService eventService;

    @RequestMapping(method = RequestMethod.GET)
    public String _index(ModelMap model) {
        return "redirect:/map";
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String index(ModelMap model) {

//        MyEvent myEvent = new MyEvent();
//
//        myEvent.setPlcID(2);
//        myEvent.setTitle("Событие");
//        myEvent.setDiscription("Захват мира");
//        myEvent.setHaveImgs(false);
//
//        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
//        try {
//            myEvent.setStart(formatter.parse("01.02.2016 21:05"));
//            myEvent.setFinish(formatter.parse("02.03.2016 21:06"));
//            myEvent.setCatID(4);
//            myEvent.setuID(1);
//
//            eventService.save(myEvent);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

        return "map";
    }
}


