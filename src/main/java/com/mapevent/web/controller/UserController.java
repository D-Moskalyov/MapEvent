package com.mapevent.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        return "login";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(ModelMap model) {
        return "registration";
    }

    @RequestMapping(value = "/newevent", method = RequestMethod.GET)
    public String newEvent(ModelMap model) {
        return "newEvent";
    }
}
