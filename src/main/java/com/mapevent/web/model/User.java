package com.mapevent.web.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
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


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    List<Event> events;
}
