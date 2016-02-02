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


//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
//    List<MyEvent> myEvents;

//    @ManyToMany
//    @JoinTable(name="parentChldCat",
//            joinColumns = @JoinColumn(name="prntID", referencedColumnName="catID"),
//            inverseJoinColumns = @JoinColumn(name="chldID", referencedColumnName="catID")
//    )
//    List<Category> categories;


    public Integer getCatID() {
        return catID;
    }

    public void setCatID(Integer catID) {
        this.catID = catID;
    }

    public String getCatPrntID() {
        return catPrntID;
    }

    public void setCatPrntID(String catPrntID) {
        this.catPrntID = catPrntID;
    }

//    public List<MyEvent> getMyEvents() {
//        return myEvents;
//    }
//
//    public void setMyEvents(List<MyEvent> myEvents) {
//        this.myEvents = myEvents;
//    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
