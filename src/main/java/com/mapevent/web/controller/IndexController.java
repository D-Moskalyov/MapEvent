package com.mapevent.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/")
public class IndexController {
    @RequestMapping(method = RequestMethod.GET)
    public String _index(ModelMap model) {
        return "redirect:/map";
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String index(ModelMap model) {
        return "map";
    }
}


