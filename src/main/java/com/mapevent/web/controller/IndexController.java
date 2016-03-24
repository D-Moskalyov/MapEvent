package com.mapevent.web.controller;


import com.mapevent.web.DTO.MarkerEventInfo;
import com.mapevent.web.model.Category;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.model.User;
import com.mapevent.web.service.CategoryService;
import com.mapevent.web.service.EventService;
import com.mapevent.web.service.PlaceService;
import com.mapevent.web.utils.DateTimeFormatter;
import com.mapevent.web.utils.StatusAuthenticationUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

        User user = StatusAuthenticationUser.getAuthenticationUser();
        if(user != null)
            model.addAttribute("userId", user.getuID());
        else
            model.addAttribute("userId", 0);



        List<Category> categoryList = categoryService.getCategoryList();
        model.addAttribute("categories", categoryList);
        model.addAttribute("categories", categoryList);
        return "map";
    }

    @RequestMapping(value = "/map.json", method = RequestMethod.POST)
    public @ResponseBody
    List<MarkerEventInfo> updateEvent(HttpServletRequest request) {
        Map<String, String[]> map = request.getParameterMap();

        Date dateSt = DateTimeFormatter.FormatTimeZoneCorrect(map.get("startDate")[0]);
        Date dateFin = DateTimeFormatter.FormatTimeZoneCorrect(map.get("finishDate")[0]);

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


