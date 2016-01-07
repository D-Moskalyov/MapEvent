package com.mapevent.web.controller;


import com.mapevent.web.modelForm.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        return "login";
    }

//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public String processLoginDefault(@ModelAttribute(value="loginForm") @Valid LoginForm loginForm, BindingResult result ) {
//        if(result.hasErrors()) {
//            return "login";
//        }
//        else {
//            return "account";
//        }
//    }

    @RequestMapping(value="/login.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processLoginAjaxJson(HttpServletRequest request){
        ValidationResponse res = new ValidationResponse();

        Map<String, String[]> map = request.getParameterMap();
        map = null;

        return res;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(ModelMap model) {
        return "registration";
    }

//    @RequestMapping(value = "/registration", method = RequestMethod.POST)
//    public String processRegDefault(@ModelAttribute(value="regForm") @Valid RegistrationForm registrationForm, BindingResult result ) {
//        if(result.hasErrors()) {
//            return "registration";
//        }
//        else {
//            //writeDB
//            return "account";
//        }
//    }

    @RequestMapping(value="/registration.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processRegAjaxJson(HttpServletRequest request){
        ValidationResponse res = new ValidationResponse();

        Map<String, String[]> map = request.getParameterMap();
        map = null;

        return res;
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String forgot(ModelMap model) {
        return "forgot";
    }

//    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
//    public String processForgotDefault(@ModelAttribute(value="forgotForm") @Valid ForgotForm forgotForm, BindingResult result ) {
//        if(result.hasErrors()) {
//            return "forgot";
//        }
//        else {
//            return "account";
//        }
//    }

    @RequestMapping(value="/forgot.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processForgotAjaxJson(HttpServletRequest request){
        ValidationResponse res = new ValidationResponse();

        Map<String, String[]> map = request.getParameterMap();
        map = null;

        return res;
    }
}
