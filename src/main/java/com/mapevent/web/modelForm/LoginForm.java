package com.mapevent.web.modelForm;


import org.hibernate.validator.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginForm {
    @NotEmpty(message = "Поле обязательно для заполнения")
    private String emailOrUser;

    @NotEmpty(message = "Поле обязательно для заполнения")
    @Size(min = 6, message = "Не менее 6 символов")
    private String password;
}
