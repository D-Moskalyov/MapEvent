package com.mapevent.web.model;

import javax.persistence.*;

@Entity
@Table(name = "favorites")
public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "F_Id")
    private Integer fID;

    @Column(name = "U_Id")
    private String uID;

    @Column(name = "Ev_Id")
    private String evID;

    //OneToOne
}
