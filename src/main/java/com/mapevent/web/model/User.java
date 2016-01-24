package com.mapevent.web.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "users")
public class User implements Serializable, UserDetails {

    static GrantedAuthority auth = new GrantedAuthority() {
        public String getAuthority() {
            return "ROLE_USER";
        }
    };

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "U_Id")
    private Integer uID;

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

    @Column(name = "Enable")
    private boolean enable;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    List<Event> events;

    public User() {
    }

    public User(String email, boolean enable, String fullName, String gender, String password, String userName) {
        this.email = email;
        this.enable = enable;
        this.fullName = fullName;
        this.gender = gender;
        this.password = password;
        this.userName = userName;
    }

    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> list = new ArrayList();
        list.add(auth);
        return list;
    }

    public boolean isEnabled() {
        return true;
        //return enable;
    }

    public boolean isCredentialsNonExpired() {
        return true;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
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

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getuID() {
        return uID;
    }

    public void setuID(Integer uID) {
        this.uID = uID;
    }

    public boolean isAccountNonExpired() {
        return true;
    }

    public boolean isAccountNonLocked() {
        return true;
    }




    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (!Objects.equals(this.userName, other.userName)) {
            return false;
        }
        if (!Objects.equals(this.fullName, other.fullName)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.gender, other.gender)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        if (!Objects.equals(this.uID, other.uID)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 79 * hash + Objects.hashCode(this.userName);
        hash = 79 * hash + Objects.hashCode(this.fullName);
        hash = 79 * hash + Objects.hashCode(this.email);
        hash = 79 * hash + Objects.hashCode(this.password);
        hash = 79 * hash + Objects.hashCode(this.gender);
        hash = 79 * hash + Objects.hashCode(this.uID);
        return hash;
    }
}
