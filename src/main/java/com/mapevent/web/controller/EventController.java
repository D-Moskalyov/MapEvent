package com.mapevent.web.controller;


import com.mapevent.web.DTO.EventWithTags;
import com.mapevent.web.exceptions.UserWithoutEvents;
import com.mapevent.web.model.MyEvent;
import com.mapevent.web.model.Place;
import com.mapevent.web.model.User;
import com.mapevent.web.service.CategoryService;
import com.mapevent.web.service.EventService;
import com.mapevent.web.service.FavoriteService;
import com.mapevent.web.service.PlaceService;
import com.mapevent.web.utils.DateTimeFormatter;
import com.mapevent.web.utils.ErrorMessage;
import com.mapevent.web.DTO.NewEventForm;
import com.mapevent.web.exceptions.EventNotExistException;
import com.mapevent.web.utils.ValidationResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/event")
public class EventController {
    @Autowired
    PlaceService placeService;
    @Autowired
    EventService eventService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    FavoriteService favoriteService;

    @RequestMapping(value = "/newevent", method = RequestMethod.GET)
    public String showNewEvent(ModelMap model) {
        NewEventForm newEventForm = new NewEventForm();
        newEventForm.setEdit(false);
        model.addAttribute("newEventForm", newEventForm);
        //model.addAttribute("isEdit", false);
        return "newEvent";
    }

    @RequestMapping(value = "/newevent", method = RequestMethod.POST)
    public String processFormDefault(@ModelAttribute(value="newEventForm") @Valid NewEventForm newEventForm, BindingResult result ) {
        if(result.hasErrors()) {
            return "newEvent";
        }
        else {
            //writeDB
            return "eventEditPage";
        }
    }

    @RequestMapping(value="/newevent.json",method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processFormAjaxJson(Model model, @ModelAttribute(value="newEventForm") @Valid NewEventForm newEventForm,
                                            BindingResult result ){
        ValidationResponse res = new ValidationResponse();
        //DateTimeFormatter.FormatTimeZoneCorrect(newEventForm.getWhenStart());
        //if(!newEventForm.isEdit()) {
            if (!result.hasErrors()) {
                String plcIDGoogle = newEventForm.getPlaceID();
                String addressLine1 = newEventForm.getRoute();
                String addressLine2 = newEventForm.getStreet_number();
                String city = newEventForm.getLocality();
                String state = newEventForm.getAdministrative_area_level_1();
                String country = newEventForm.getCountry();
                Double lat = Double.parseDouble(newEventForm.getLat());
                Double lng = Double.parseDouble(newEventForm.getLng());

                int idPlace = placeService.placeAlreadyExist(plcIDGoogle, addressLine1, addressLine2,
                        city, state, country, lat, lng);

                if (idPlace == 0) {
                    Place place = new Place();

                    place.setPlcIDGoogle(newEventForm.getPlaceID());
                    place.setAddressLine1(newEventForm.getRoute());
                    place.setAddressLine2(newEventForm.getStreet_number());
                    place.setCity(newEventForm.getLocality());
                    place.setState(newEventForm.getAdministrative_area_level_1());
                    place.setCountry(newEventForm.getCountry());
                    //(double)(Math.round(Double.parseDouble(newEventForm.getLng()) * 1000000d) / 1000000d);
                    double dblat = (double) (Math.round(Double.parseDouble(newEventForm.getLat()) * 1000000d) / 1000000d);
                    double dblng = (double) (Math.round(Double.parseDouble(newEventForm.getLng()) * 1000000d) / 1000000d);
                    place.setLat(dblat);
                    place.setLng(dblng);

                    idPlace = placeService.saveOrUpdate(place);
                }

                MyEvent myEvent = new MyEvent();

                myEvent.setPlcID(idPlace);
                myEvent.setTitle(newEventForm.getWhat());
                myEvent.setDiscription(newEventForm.getDescription());
                myEvent.setHaveImgs(false);

                //SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
                //try {
                    myEvent.setStart(DateTimeFormatter.FormatTimeZoneCorrect(newEventForm.getWhenStart()));
                    myEvent.setFinish(DateTimeFormatter.FormatTimeZoneCorrect(newEventForm.getWhenFinish()));

                    int catID = categoryService.getCatID(newEventForm.getCategory());
                    if (catID != 0) {
                        myEvent.setCatID(catID);
                    }

                    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                    if (authentication != null) {
                        User user = (User) authentication.getPrincipal();
                        myEvent.setuID(user.getuID());
                        if(newEventForm.isEdit()) {
                            try {
                                eventService.delete(eventService.getEventByID(newEventForm.getId()));
                            } catch (EventNotExistException e) {
                                e.printStackTrace();
                            }
                        }
                        eventService.saveOrUpdate(myEvent);

                        res.setStatus("SUCCESS");
                    } else {
                        res.setStatus("FAIL");
                    }
                //} catch (ParseException e) {
                //    e.printStackTrace();
                //    res.setStatus("FAIL");
                //}

            } else {
                res.setStatus("FAIL");
                List<FieldError> allErrors = result.getFieldErrors();
                List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
                for (FieldError objectError : allErrors) {
                    errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getDefaultMessage()));
                }
                res.setErrorMessageList(errorMesages);

            }
        //}

        return res;
    }

    @RequestMapping(path = "/{eventID}", method = RequestMethod.GET)
    public ModelAndView showEventPage(@PathVariable String eventID, Model model) {
        MyEvent myEvent = new MyEvent();
        EventWithTags eventWithTags = new EventWithTags();
        Map map = new HashMap<String, Object>();
        try {
            myEvent = eventService.getEventByID(Integer.parseInt(eventID));
            eventWithTags.setEvent(myEvent);
        } catch (EventNotExistException e) {
            return new ModelAndView("./map");
        }

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication != null) {
            Object user = (Object) authentication.getPrincipal();
            if(user.getClass() == User.class) {
                map.put("user", ((User) user).getuID());
                if(myEvent.getuID() == ((User) user).getuID())
                    eventWithTags.setMyEvent(true);
                else
                    eventWithTags.setMyEvent(false);
                try {
                    favoriteService.getPair(((User) user).getuID(),myEvent.getEvID() );
                    eventWithTags.setFavorite(true);
                } catch (UserWithoutEvents e) {
                    e.printStackTrace();
                    eventWithTags.setFavorite(false);
                }
            }
            else
                map.put("user", 0);
        }
        else{
            map.put("user", 0);
        }
        map.put("eventWithTags", eventWithTags);
        return new ModelAndView("event", map);
    }

    @RequestMapping(path = "edit/{eventID}", method = RequestMethod.GET)
    public String editEventPage(@PathVariable String eventID, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object user = (Object) authentication.getPrincipal();
            if (user.getClass() == User.class){
                try {
                    MyEvent event = eventService.getEventByID(Integer.parseInt(eventID));
                    if(event.getuID() == ((User)user).getuID()) {
                        NewEventForm newEventForm = new NewEventForm();

                        newEventForm.setId(event.getEvID());
                        newEventForm.setWhat(event.getTitle());
                        newEventForm.setCategory(event.getCategory().getTitle());
                        newEventForm.setCountry(event.getPlace().getCountry());
                        newEventForm.setAdministrative_area_level_1(event.getPlace().getState());
                        newEventForm.setLocality(event.getPlace().getCity());
                        newEventForm.setRoute(event.getPlace().getAddressLine1());
                        newEventForm.setStreet_number(event.getPlace().getAddressLine2());
                        newEventForm.setLng(String.valueOf(event.getPlace().getLng()));
                        newEventForm.setLat(String.valueOf(event.getPlace().getLat()));
                        newEventForm.setPlaceID(event.getPlace().getPlcIDGoogle());
                        newEventForm.setDescription(event.getDiscription());
                        newEventForm.setWhenStart(event.getStart().toString());
                        newEventForm.setWhenFinish(event.getFinish().toString());
                        newEventForm.setEdit(true);

//                        newEventForm.setWhenStart("2016-03-07 23:09");
//                        newEventForm.setWhenFinish("2016-03-13 23:10");

                        model.addAttribute("newEventForm", newEventForm);
                        return "newEvent";

                        //return "eventEditPage";
                    }
                } catch (EventNotExistException e) {
                    e.printStackTrace();
                }
            }
        }
        return "redirect:" + "../../map";
    }

    @RequestMapping(value = "/delete.json", method = RequestMethod.POST)
    public @ResponseBody
    ValidationResponse deleteEvent(@RequestParam("idDelEv") int id) {
        ValidationResponse res = new ValidationResponse();
        ArrayList<ErrorMessage> errorMessages = new ArrayList<ErrorMessage>();

        try {
            eventService.delete(eventService.getEventByID(id));
        } catch (EventNotExistException e) {
            e.printStackTrace();
        }

        res.setErrorMessageList(errorMessages);
        return res;
    }
}

