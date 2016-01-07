package com.mapevent.web.modelForm;


import org.hibernate.validator.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginForm {
    //@NotEmpty(message = "Поле обязательно для заполнения")
    private String lg_username;

    //@NotEmpty(message = "Поле обязательно для заполнения")
    //@Size(min = 6, message = "Не менее 6 символов")
    private String lg_password;

    private String lg_remember;

    public String getLg_password() {
        return lg_password;
    }

    public void setLg_password(String lg_password) {
        this.lg_password = lg_password;
    }

    public String getLg_username() {
        return lg_username;
    }

    public void setLg_username(String lg_username) {
        this.lg_username = lg_username;
    }

    public String getLg_remember() {
        return lg_remember;
    }

    public void setLg_remember(String lg_remember) {
        this.lg_remember = lg_remember;
    }
}
