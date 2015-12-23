package com.mapevent.web.model;

import javax.persistence.*;

@Entity
@Table(name = "categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Cat_Id")
    private Integer catID;

    @Column(name = "Cat_Prnt_Id")
    private String catPrntID;

    @Column(name = "Title")
    private String title;

//    @ManyToOne
//    @JoinColumn(name ="Cat_Id")
//    Category category;
}
