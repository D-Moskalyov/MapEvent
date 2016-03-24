package com.mapevent.web.controller;


import com.google.api.services.gmail.Gmail;
import com.mapevent.web.exceptions.UserWithoutEvents;
import com.mapevent.web.exceptions.UserWithoutFavEvent;
import com.mapevent.web.model.Favorite;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.model.User;
import com.mapevent.web.model.WaitConfirm;
import com.mapevent.web.DTO.*;
import com.mapevent.web.service.EventService;
import com.mapevent.web.service.FavoriteService;
import com.mapevent.web.utils.*;
import com.mapevent.web.service.UserService;
import com.mapevent.web.service.WaitConfirmsService;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    UserService userService;
    @Autowired
    WaitConfirmsService waitConfirmsService;
    @Autowired
    EventService eventService;
    @Autowired
    FavoriteService favoriteService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        return "login";
    }

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

            try {
                MimeMessage mimeMessage = GmailSender.createEmail(map.get("reg_email")[0], "Activate account on MapEvent", validPath);
                Gmail gmailService = GmailSender.getGmailService();
                GmailSender.sendMessage(gmailService, "me", mimeMessage);

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
            } catch (MessagingException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

//            if(GoogleMessenger.SendMessage(map.get("reg_email")[0], "Activate account on MapEvent", validPath)){
//                WaitConfirm waitConfirm = new WaitConfirm();
//                waitConfirm.setEmail(map.get("reg_email")[0]);
//                waitConfirm.setFullName(map.get("reg_fullname")[0]);
//                if(map.get("male")[0].equals("on"))
//                    waitConfirm.setGender("male");
//                else
//                    waitConfirm.setGender("female");
//                waitConfirm.setHashConfirm(hash);
//                waitConfirm.setPassword(MD5.getHash(map.get("reg_password")[0]));
//                waitConfirm.setSend_Email(new Date());
//                waitConfirm.setUserName(map.get("reg_username")[0]);
//
//                waitConfirmsService.save(waitConfirm);
//            }

        }

        res.setErrorMessageList(errorMessages);
        return res;
    }




    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String forgot(ModelMap model) {
        return "forgot";
    }

    @RequestMapping(value="/forgot", method=RequestMethod.POST)
    String processForgotNotAjaxJson(@ModelAttribute(value="forgot") @Valid ForgotForm forgotForm, BindingResult result ){
        //result.addError(new ObjectError("Ajax not available", "try later"));
        return "forgot";
    }

    @RequestMapping(value="/forgot.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processForgotAjaxJson(HttpServletRequest request){
        ValidationResponse res = new ValidationResponse();
        ArrayList<ErrorMessage> errorMessages = new ArrayList<ErrorMessage>();
        Map<String, String[]> map = request.getParameterMap();
        if (userService.userAlreadyExist(map.get("fp_email")[0])) {
            String newPass = RandomPassword.generateRandomPassword();
            String newPassMess = "Ваш новый пароль на http://localhost:8080 : " + newPass;

            MimeMessage mimeMessage = null;
            try {
                mimeMessage = GmailSender.createEmail(map.get("fp_email")[0], "New password on MapEvent", newPassMess);
                Gmail gmailService = GmailSender.getGmailService();
                GmailSender.sendMessage(gmailService, "me", mimeMessage);

                userService.updateUserPassword(map.get("fp_email")[0], newPass);
            } catch (Exception e) {
                e.printStackTrace();
                res.setStatus("FAIL");
                errorMessages.add(new ErrorMessage("", "Не удалось отправить сообщение"));
            }


//            if(GoogleMessenger.SendMessage(map.get("fp_email")[0], "New password on MapEvent", newPassMess)){
//                userService.updateUserPassword(map.get("fp_email")[0], newPass);
//            }
//            else {
//                res.setStatus("FAIL");
//                errorMessages.add(new ErrorMessage("", "Не удалось отправить сообщение"));
//            }
        }
        else{
            res.setStatus("FAIL");
            errorMessages.add(new ErrorMessage("", "Email doesn't exist"));
        }

        res.setErrorMessageList(errorMessages);
        return res;
    }




    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(ModelMap model) {
        return "profile";
    }

    @RequestMapping(value="/profile", method=RequestMethod.POST)
    String processProfileNotAjaxJson(@ModelAttribute(value="profile") @Valid ChangePassForm changePassForm, BindingResult result ){
        //result.addError(new ObjectError("Ajax not available", "try later"));
        return "profile";
    }

    @RequestMapping(value="/profile.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processProfileAjaxJson(HttpServletRequest request){
        ValidationResponse res = new ValidationResponse();
        //ArrayList<ErrorMessage> errorMessages = new ArrayList<ErrorMessage>();
        Map<String, String[]> map = request.getParameterMap();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || !(map.get("change_password")[0].equals(map.get("change_password_confirm")[0]))) {
            res.setStatus("FAIL");
        }
        else {
            User user = (User) authentication.getPrincipal();
            if(!userService.updateUserPassword(user.getEmail(), map.get("change_password")[0]))
                res.setStatus("FAIL");
        }
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




    @RequestMapping(value = "/events", method = RequestMethod.GET)
    public ModelAndView events(ModelMap model) {
        Map map = new HashMap();
        LinkedList<MyEvent> myEventList = new LinkedList<MyEvent>();
        LinkedList<MyEvent> myEventListFav = new LinkedList<MyEvent>();
        List<EventWithTags> myEventWithTagsList = new ArrayList<EventWithTags>();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication != null) {
            Object user = (Object) authentication.getPrincipal();
            if (user.getClass() == User.class) {
                try {
                    myEventList = eventService.getEventByUserID(((User) user).getuID());

                    try {
                        myEventListFav = eventService.getFavEventByUserID(((User) user).getuID());
                    } catch (UserWithoutFavEvent e) {
                        e.printStackTrace();
                    }

                    for (MyEvent myEvent : myEventList) {
                        if(myEventListFav.contains(myEvent))
                            myEventWithTagsList.add(new EventWithTags(myEvent, true, true));
                        else
                            myEventWithTagsList.add(new EventWithTags(myEvent, false, true));
                    }
                    map.put("eventsWithTags", myEventWithTagsList);
                    map.put("user", ((User) user).getuID());
                } catch (UserWithoutEvents e) {
                    e.printStackTrace();
                    map.put("eventsWithTags", myEventWithTagsList);
                    map.put("user", ((User) user).getuID());
                }
            }
        }

        return new ModelAndView("events", map);
    }




    @RequestMapping(value = "/favorite", method = RequestMethod.GET)
    public ModelAndView favorite(ModelMap model) {
        Map map = new HashMap();
        LinkedList<MyEvent> myEventList = new LinkedList<MyEvent>();
        LinkedList<MyEvent> myEventListMyEv = new LinkedList<MyEvent>();
        List<EventWithTags> myEventWithTagsList = new ArrayList<EventWithTags>();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication != null) {
            Object user = (Object) authentication.getPrincipal();
            if (user.getClass() == User.class) {
                try {
                    myEventList = eventService.getFavEventByUserID(((User) user).getuID());

                    try {
                        myEventListMyEv = eventService.getEventByUserID(((User) user).getuID());
                    } catch (UserWithoutEvents e) {
                        e.printStackTrace();
                    }

                    for (MyEvent myEvent : myEventList) {
                        if(myEventListMyEv.contains(myEvent))
                            myEventWithTagsList.add(new EventWithTags(myEvent, true, true));
                        else
                            myEventWithTagsList.add(new EventWithTags(myEvent, true, false));
                    }

                    map.put("eventsWithTags", myEventWithTagsList);
                    map.put("user", ((User) user).getuID());
                } catch (UserWithoutFavEvent e) {
                    e.printStackTrace();
                    map.put("eventsWithTags", myEventWithTagsList);
                    map.put("user", ((User) user).getuID());
                }
            }
        }


        return new ModelAndView("events", map);
    }

    @RequestMapping(value="/favorite.json", method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processFavoritetAjaxJson(HttpServletRequest request){
        ValidationResponse res = new ValidationResponse();
        Map<String, String[]> map = request.getParameterMap();

        if(map.get("fav")[0].equals("off")){
            Favorite favorite = null;
            try {
                favorite = favoriteService.getPair(Integer.parseInt(map.get("userID")[0]),
                        Integer.parseInt(map.get("eventID")[0]));
                res.setStatus("SUCCESS");
            } catch (UserWithoutEvents userWithoutEvents) {
                userWithoutEvents.printStackTrace();
                res.setStatus("FAIL");
            }
            favoriteService.delete(favorite);
        }
        else {
            try {
                favoriteService.getPair(Integer.parseInt(map.get("userID")[0]),
                        Integer.parseInt(map.get("eventID")[0]));

                res.setStatus("FAIL");
            } catch (UserWithoutEvents userWithoutEvents) {
                Favorite favorite = new Favorite();
                favorite.setEvID(Integer.parseInt(map.get("eventID")[0]));
                favorite.setuID(Integer.parseInt(map.get("userID")[0]));

                favoriteService.save(favorite);

                res.setStatus("SUCCESS");
            }
        }

        res.setErrorMessageList(null);
        return res;
    }

    @RequestMapping(value="/credentials", method=RequestMethod.POST)
    public void Credentials(HttpServletRequest request){
        int i = 5;
        int j = i;
    }
}
