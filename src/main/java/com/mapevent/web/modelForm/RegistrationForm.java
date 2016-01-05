package com.mapevent.web.modelForm;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;

public class RegistrationForm {
    @NotEmpty(message = "Поле обязательно для заполнения")
    private String username;

    @NotEmpty(message = "Поле обязательно для заполнения")
    @Size(min = 6, message = "Не менее 6 символов")
    private String password;

    @NotEmpty(message = "Поле обязательно для заполнения")
    private String confirmPassword;

    @NotEmpty(message = "Поле обязательно для заполнения")
    @Email(message = "Формат адреса не известен")
    private String email;

    @NotEmpty(message = "Поле обязательно для заполнения")
    private String fullName;

    @AssertTrue(message="Пароли не совпадают")
    public boolean isСonfirmPassValid() {
        if(password.equals(confirmPassword))
            return true;
        return false;
    }
}
