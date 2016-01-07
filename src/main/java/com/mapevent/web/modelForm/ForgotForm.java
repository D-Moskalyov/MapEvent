package com.mapevent.web.modelForm;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class ForgotForm {
    //@NotEmpty(message = "Поле обязательно для заполнения")
    //@Email(message = "Формат адреса не известен")
    private String fp_email;

    public String getFp_email() {
        return fp_email;
    }

    public void setFp_email(String fp_email) {
        this.fp_email = fp_email;
    }
}
