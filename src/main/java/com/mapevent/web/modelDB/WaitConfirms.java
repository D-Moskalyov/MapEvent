package com.mapevent.web.modelDB;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class WaitConfirms {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "WC_Id")
    private Integer wC_Id;

    @Column(name = "Username", unique = true)
    private String userName;

    @Column(name = "FullName")
    private String fullName;

    @Column(name = "Email", unique = true)
    private String email;

    @Column(name = "Password")
    private String password;

    @Column(name = "Gender")
    private String gender;

    @Column(name = "HashConfirm")
    private String hashConfirm;

    @Column(name = "Send_Email")
    private Date send_Email;

    public Date getSend_Email() {
        return send_Email;
    }

    public void setSend_Email(Date send_Email) {
        this.send_Email = send_Email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getHashConfirm() {
        return hashConfirm;
    }

    public void setHashConfirm(String hashConfirm) {
        this.hashConfirm = hashConfirm;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getwC_Id() {
        return wC_Id;
    }

    public void setwC_Id(Integer wC_Id) {
        this.wC_Id = wC_Id;
    }
}
