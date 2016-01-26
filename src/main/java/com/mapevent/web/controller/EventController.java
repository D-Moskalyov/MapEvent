package com.mapevent.web.controller;


import com.mapevent.web.model.Event;
import com.mapevent.web.model.Place;
import com.mapevent.web.model.User;
import com.mapevent.web.service.CategoryService;
import com.mapevent.web.service.EventService;
import com.mapevent.web.service.PlaceService;
import com.mapevent.web.service.UserService;
import com.mapevent.web.utils.ErrorMessage;
import com.mapevent.web.DTO.NewEventForm;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/event")
public class EventController {
    @Autowired
    PlaceService placeService;
    @Autowired
    EventService eventService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/newevent", method = RequestMethod.GET)
    public String showNewEvent(ModelMap model) {
        model.addAttribute("newEventForm", new NewEventForm());
        return "newEvent";
    }

    @RequestMapping(value = "/newevent", method = RequestMethod.POST)
    public String processFormDefault(@ModelAttribute(value="newEventForm") @Valid NewEventForm newEventForm, BindingResult result ) {
        if(result.hasErrors()) {
            return "newEvent";
        }
        else {
            //writeDB
            return "eventPage";
        }
    }

    @RequestMapping(value="/newevent.json",method=RequestMethod.POST)
    public @ResponseBody
    ValidationResponse processFormAjaxJson(Model model, @ModelAttribute(value="newEventForm") @Valid NewEventForm newEventForm, BindingResult result ){
        ValidationResponse res = new ValidationResponse();
        if(!result.hasErrors()){
            Place place = new Place();

            place.setPlcIDGoogle(newEventForm.getPlaceID());
            place.setAddressLine1(newEventForm.getRoute());
            place.setAddressLine2(newEventForm.getStreet_number());
            place.setCity(newEventForm.getLocality());
            place.setState(newEventForm.getAdministrative_area_level_1());
            place.setCountry(newEventForm.getCountry());
            place.setLat(Double.parseDouble(newEventForm.getLat()));
            place.setLng(Double.parseDouble(newEventForm.getLng()));

            int idPlace = placeService.saveOrUpdate(place);

            Event event = new Event();

            event.setPlcID(idPlace);
            event.setTitle(newEventForm.getWhat());
            event.setDiscription(newEventForm.getDescription());
            event.setHaveImgs(false);

            SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            try {
                event.setStart(formatter.parse(newEventForm.getWhenStart()));
                event.setFinish(formatter.parse(newEventForm.getWhenFinish()));

                int catID = categoryService.getCatID(newEventForm.getCategory());
                if(catID != 0)
                    event.setCatID(catID);

                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                if(authentication != null) {
                    User user = (User) authentication.getPrincipal();
                    event.setuID(user.getuID());

                    eventService.save(event);

                    res.setStatus("SUCCESS");
                }
                else{
                    res.setStatus("FAIL");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                res.setStatus("FAIL");
            }

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

    @RequestMapping(path = "/{eventID}", method = RequestMethod.GET)
    public ModelAndView showEventPage(@PathVariable String eventID, Model model) {
        Event event = new Event();
        return new ModelAndView("event", "event", event);
    }
}
