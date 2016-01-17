package com.mapevent.web.controller;


import com.mapevent.web.modelDB.User;
import com.mapevent.web.modelDB.WaitConfirm;
import com.mapevent.web.modelForm.*;
import com.mapevent.web.utils.MD5;
import com.mapevent.web.service.UserService;
import com.mapevent.web.utils.GoogleMessenger;
import com.mapevent.web.service.WaitConfirmsService;
import com.mapevent.web.utils.RandomPassword;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    UserService userService;
    @Autowired
    WaitConfirmsService waitConfirmsService;

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

    @RequestMapping(value="/login", method=RequestMethod.POST)
    String processLoginNotAjaxJson(@ModelAttribute(value="loginForm") @Valid LoginForm loginForm, BindingResult result ){
        //result.addError(new ObjectError("Ajax not available", "try later"));
            return "login";
    }

    @RequestMapping(value="/login.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processLoginAjaxJson(HttpServletRequest request){
        ValidationResponse res = new ValidationResponse();
        ArrayList<ErrorMessage> errorMessages = new ArrayList<ErrorMessage>();

        Map<String, String[]> map = request.getParameterMap();

        try {
            UserDetails userDetails = userService.loadUserByUsername(map.get("lg_username")[0]);
//            logger.debug("MD5", MD5.getHash(map.get("lg_password")[0]));
            if(MD5.getHash(map.get("lg_password")[0]).equals(userDetails.getPassword())){
                if(!userService.authenticateUser(userDetails, map.get("lg_remember")[0])) {
                    res.setStatus("FAIL");
                    errorMessages.add(new ErrorMessage("authenticate", "error"));
                }
            }
            else{
                res.setStatus("FAIL");
                errorMessages.add(new ErrorMessage("", "password is wrong"));
            }
        } catch (UsernameNotFoundException e){
            res.setStatus("FAIL");
            errorMessages.add(new ErrorMessage("", e.getMessage()));
        }
        res.setErrorMessageList(errorMessages);

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

    @RequestMapping(value="/registration", method=RequestMethod.POST)
    String processRegNotAjaxJson(@ModelAttribute(value="registration") @Valid RegistrationForm registrationForm, BindingResult result ){
        //result.addError(new ObjectError("Ajax not available", "try later"));
        return "registration";
    }

    @RequestMapping(value="/registration.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processRegAjaxJson(HttpServletRequest request) {
        ValidationResponse res = new ValidationResponse();
        ArrayList<ErrorMessage> errorMessages = new ArrayList<ErrorMessage>();

        Map<String, String[]> map = request.getParameterMap();
        //if (userService.userAlreadyExist(map.get("reg_username")[0])) {
        if (userService.userAlreadyExist(map.get("reg_username")[0]) | userService.userAlreadyExist(map.get("reg_email")[0]) |
                userService.emailAlreadyExist(map.get("reg_username")[0]) | userService.emailAlreadyExist(map.get("reg_email")[0])) {
            res.setStatus("FAIL");
            errorMessages.add(new ErrorMessage("", "user or email already exist"));
        }
        else if (waitConfirmsService.userAlreadyExist(map.get("reg_username")[0]) | waitConfirmsService.userAlreadyExist(map.get("reg_email")[0]) |
                waitConfirmsService.emailAlreadyExist(map.get("reg_username")[0]) | waitConfirmsService.emailAlreadyExist(map.get("reg_email")[0])){
        //else if (waitConfirmsService.userAlreadyExist(map.get("reg_username")[0])) {
            res.setStatus("FAIL");
            errorMessages.add(new ErrorMessage("", "check your email. You already registration"));
        }
        else {
            String hash = MD5.getHash(map.get("reg_password")[0] + map.get("reg_username")[0] + map.get("reg_email")[0]);
//            String validPath = "Приветствуем. Для завершения процесса регистрации пройдите по следующему адресу : " +
//                    "<html>" +
//                    "<a href=\"http://localhost:8080/user/confirm?confirmPath=" + hash + "\">" +
//                    "localhost:8080/user/confirm?confirmPath=" + hash + "</a>" + "</html>";
            String validPath = "Приветствуем. Для завершения процесса регистрации пройдите по следующему адресу : " +
                    "http://localhost:8080/user/confirm?confirmPath=" + hash;
            if(GoogleMessenger.SendMessage(map.get("reg_email")[0], "Activate account on MapEvent", validPath)){
                WaitConfirm waitConfirm = new WaitConfirm();
                waitConfirm.setEmail(map.get("reg_email")[0]);
                waitConfirm.setFullName(map.get("reg_fullname")[0]);
                if(map.get("male")[0].equals("on"))
                    waitConfirm.setGender("male");
                else
                    waitConfirm.setGender("female");
                waitConfirm.setHashConfirm(hash);
                waitConfirm.setPassword(MD5.getHash(map.get("reg_password")[0]));
                waitConfirm.setSend_Email(new Date());
                waitConfirm.setUserName(map.get("reg_username")[0]);

                waitConfirmsService.save(waitConfirm);
            }

        }

        res.setErrorMessageList(errorMessages);
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
        ArrayList<ErrorMessage> errorMessages = new ArrayList<ErrorMessage>();
        Map<String, String[]> map = request.getParameterMap();
        if (userService.userAlreadyExist(map.get("fp_email")[0])) {
            String newPass = RandomPassword.generateRandomPassword();
            String newPassMess = "Ваш новый пароль на http://localhost:8080 : " + newPass;
            if(GoogleMessenger.SendMessage(map.get("fp_email")[0], "New password on MapEvent", newPassMess)){
                userService.updateUserPassword(map.get("fp_email")[0], newPass);
            }
            else {
                res.setStatus("FAIL");
                errorMessages.add(new ErrorMessage("", "Не удалось отправить сообщение"));
            }
        }
        else{
            res.setStatus("FAIL");
            errorMessages.add(new ErrorMessage("", "Email doesn't exist"));
        }

        res.setErrorMessageList(errorMessages);
        return res;
    }

    @RequestMapping(value = "/confirm", method = RequestMethod.GET)
    public String confirm(ModelMap model, @RequestParam("confirmPath") String code) {
        User user = waitConfirmsService.checkCode(code);
        if (user.getEmail() != null) {
            userService.save(user);
            userService.authenticateUser(user, "on");
            model.addAttribute("Title", "Регистрация завершена");
            model.addAttribute("Message", "Перенаправление на главную страницу");
        }
        else {
            model.addAttribute("Title", "Ошибка");
            model.addAttribute("Message", "Вероятно срок действия активации истёк. Попробуйте пройти процедуру заново");
        }
        return "confirm";
    }
}
