package com.mapevent.web.DTO;

public class ChangePassForm {
    private String change_password;

    private String change_password_confirm;

    public String getChange_password() {
        return change_password;
    }

    public void setChange_password(String change_password) {
        this.change_password = change_password;
    }

    public String getChange_password_confirm() {
        return change_password_confirm;
    }

    public void setChange_password_confirm(String change_password_confirm) {
        this.change_password_confirm = change_password_confirm;
    }
}
