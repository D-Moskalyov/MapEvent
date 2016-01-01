package com.mapevent.web.controller;


import com.mapevent.web.model.NewEventForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/event")
public class EventController {
    @RequestMapping(value = "/newevent", method = RequestMethod.GET)
    public String newEvent(ModelMap model) {
        model.addAttribute("newEventForm", new NewEventForm());
        return "newEvent";
    }
}
