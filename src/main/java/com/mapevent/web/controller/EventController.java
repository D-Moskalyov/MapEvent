package com.mapevent.web.controller;


import com.mapevent.web.modelForm.ErrorMessage;
import com.mapevent.web.modelForm.NewEventForm;
import com.mapevent.web.modelForm.ValidationResponse;
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
@RequestMapping("/event")
public class EventController {
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
