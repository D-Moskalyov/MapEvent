package com.mapevent.web.modelForm;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class ForgotForm {
    @NotEmpty(message = "Поле обязательно для заполнения")
    @Email(message = "Формат адреса не известен")
    private String email;
}
