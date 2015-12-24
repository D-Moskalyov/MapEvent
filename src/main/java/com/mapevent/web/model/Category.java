package com.mapevent.web.model;

import javax.persistence.*;
import java.util.List;

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


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
    List<Event> events;

    @ManyToMany
    @JoinTable(name="parentChldCat",
            joinColumns = @JoinColumn(name="prntID", referencedColumnName="catID"),
            inverseJoinColumns = @JoinColumn(name="chldID", referencedColumnName="catID")
    )
    List<Category> categories;
}
