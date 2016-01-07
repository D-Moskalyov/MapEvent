package com.mapevent.web.modelForm;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;

public class RegistrationForm {
    //@NotEmpty(message = "Поле обязательно для заполнения")
    private String reg_username;

    //@NotEmpty(message = "Поле обязательно для заполнения")
    //@Size(min = 6, message = "Не менее 6 символов")
    private String reg_password;

    //@NotEmpty(message = "Поле обязательно для заполнения")
    private String reg_password_confirm;

    //@NotEmpty(message = "Поле обязательно для заполнения")
    //@Email(message = "Формат адреса не известен")
    private String reg_email;

    //@NotEmpty(message = "Поле обязательно для заполнения")
    private String reg_fullname;

    private String reg_gender;

    private String reg_agree;

//    @AssertTrue(message="Пароли не совпадают")
//    public boolean isСonfirmPassValid() {
//        if(reg_password.equals(reg_password_confirm))
//            return true;
//        return false;
//    }


    public String getReg_agree() {
        return reg_agree;
    }

    public void setReg_agree(String reg_agree) {
        this.reg_agree = reg_agree;
    }

    public String getReg_email() {
        return reg_email;
    }

    public void setReg_email(String reg_email) {
        this.reg_email = reg_email;
    }

    public String getReg_fullname() {
        return reg_fullname;
    }

    public void setReg_fullname(String reg_fullname) {
        this.reg_fullname = reg_fullname;
    }

    public String getReg_gender() {
        return reg_gender;
    }

    public void setReg_gender(String reg_gender) {
        this.reg_gender = reg_gender;
    }

    public String getReg_password() {
        return reg_password;
    }

    public void setReg_password(String reg_password) {
        this.reg_password = reg_password;
    }

    public String getReg_password_confirm() {
        return reg_password_confirm;
    }

    public void setReg_password_confirm(String reg_password_confirm) {
        this.reg_password_confirm = reg_password_confirm;
    }

    public String getReg_username() {
        return reg_username;
    }

    public void setReg_username(String reg_username) {
        this.reg_username = reg_username;
    }
}
