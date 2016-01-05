package com.mapevent.web.controller;


import com.mapevent.web.modelForm.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String processLoginDefault(@ModelAttribute(value="loginForm") @Valid LoginForm loginForm, BindingResult result ) {
        if(result.hasErrors()) {
            return "login";
        }
        else {
            return "account";
        }
    }

    @RequestMapping(value="/login.json",method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processLoginAjaxJson(Model model, @ModelAttribute(value="loginForm") @Valid LoginForm loginForm, BindingResult result ){
        ValidationResponse res = new ValidationResponse();
        if(!result.hasErrors()){
            res.setStatus("SUCCESS");
        }else{
            res.setStatus("FAIL");
            List<FieldError> allErrors = result.getFieldErrors();
            List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
            for (FieldError objectError : allErrors) {
                errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getDefaultMessage()));
            }
            res.setErrorMessageList(errorMesages);

        }

        return res;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(ModelMap model) {
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String processRegDefault(@ModelAttribute(value="regForm") @Valid RegistrationForm registrationForm, BindingResult result ) {
        if(result.hasErrors()) {
            return "registration";
        }
        else {
            //writeDB
            return "account";
        }
    }

    @RequestMapping(value="/registration.json",method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processRegAjaxJson(Model model, @ModelAttribute(value="regForm") @Valid RegistrationForm registrationForm, BindingResult result ){
        ValidationResponse res = new ValidationResponse();
        if(!result.hasErrors()){
            res.setStatus("SUCCESS");
        }else{
            res.setStatus("FAIL");
            List<FieldError> allErrors = result.getFieldErrors();
            List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
            for (FieldError objectError : allErrors) {
                errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getDefaultMessage()));
            }
            res.setErrorMessageList(errorMesages);

        }

        return res;
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String forgot(ModelMap model) {
        return "forgot";
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
    public String processForgotDefault(@ModelAttribute(value="forgotForm") @Valid ForgotForm forgotForm, BindingResult result ) {
        if(result.hasErrors()) {
            return "forgot";
        }
        else {
            return "account";
        }
    }

    @RequestMapping(value="/forgot.json",method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processForgotAjaxJson(Model model, @ModelAttribute(value="forgotForm") @Valid ForgotForm forgotForm, BindingResult result ){
        ValidationResponse res = new ValidationResponse();
        if(!result.hasErrors()){
            res.setStatus("SUCCESS");
        }else{
            res.setStatus("FAIL");
            List<FieldError> allErrors = result.getFieldErrors();
            List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
            for (FieldError objectError : allErrors) {
                errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getDefaultMessage()));
            }
            res.setErrorMessageList(errorMesages);

        }

        return res;
    }
}
