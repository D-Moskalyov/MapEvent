package com.mapevent.web.controller;


import com.mapevent.web.DTO.MarkerEventInfo;
import com.mapevent.web.model.Category;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.model.Place;
import com.mapevent.web.service.CategoryService;
import com.mapevent.web.service.EventService;
import com.mapevent.web.service.PlaceService;
import com.mapevent.web.utils.DateTimeFormatter;
import com.mapevent.web.utils.ErrorMessage;
import com.mapevent.web.utils.ValidationResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    EventService eventService;
    @Autowired
    PlaceService placeService;

    @RequestMapping(method = RequestMethod.GET)
    public String _index(ModelMap model) {
        return "redirect:/map";
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String index(ModelMap model) {

//        MyEvent myEvent = new MyEvent();
//
//        myEvent.setPlcID(1);
//        myEvent.setTitle("�������");
//        myEvent.setDiscription("������ ����");
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
        List<Category> categoryList = categoryService.getCategoryList();
        model.addAttribute("categories", categoryList);
        return "map";
    }

    @RequestMapping(value = "/map.json", method = RequestMethod.POST)
    public @ResponseBody
    List<MarkerEventInfo> updateEvent(HttpServletRequest request) {
        Map<String, String[]> map = request.getParameterMap();

//        List<Place> places = placeService.getPlacesByCoord(Double.parseDouble(map.get("NElat")[0]), Double.parseDouble(map.get("NElng")[0]),
//                Double.parseDouble(map.get("SWlat")[0]), Double.parseDouble(map.get("SWlng")[0]));
//
//        HashSet<Integer> placeIDs = new HashSet<Integer>();
//        for (Place place: places){
//            placeIDs.add(place.getPlcID());
//        }

        //SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss Z");
        //formatter.setTimeZone(TimeZone.getTimeZone("GMT"));

        //Date dateSt = null;
        //Date dateFin = null;
//        String stDate = map.get("startDate")[0];
//        String finDate = map.get("finishDate")[0];
        //try {
        Date dateSt = DateTimeFormatter.FormatTimeZoneCorrect(map.get("startDate")[0]);
        Date dateFin = DateTimeFormatter.FormatTimeZoneCorrect(map.get("finishDate")[0]);
        //} catch (ParseException e) {
        //    e.printStackTrace();
        //}


        ArrayList<Integer> cats = new ArrayList<Integer>();

        for(String cat: map.get("cats[]")){
            cats.add(Integer.parseInt(cat));
        }

        List<MyEvent> events = eventService.getEventForMap(dateSt, dateFin, cats,
                Double.parseDouble(map.get("NElat")[0]), Double.parseDouble(map.get("NElng")[0]),
                Double.parseDouble(map.get("SWlat")[0]), Double.parseDouble(map.get("SWlng")[0]));

        ArrayList<MarkerEventInfo> markerEventInfo = new ArrayList<MarkerEventInfo>();
        for(MyEvent event: events){
            markerEventInfo.add(new MarkerEventInfo(event.getEvID(), event.getPlace().getLat(), event.getPlace().getLng(), "markerDeff"));
        }
        return markerEventInfo;
    }
}


