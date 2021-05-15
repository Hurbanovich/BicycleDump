package com.kreva.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(schema = "bicyclestore", name = "product")
public class Product {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String series;
    private String name;
    private String brand;
    private int price;
    private String comment;
    private String picture;
    private int quantity;
    private String sections;
    private Date dateAddProduct;

    public Product() {
    }

    public Product(String series, String name, String brand,
                   int price, String comment, String picture, int quantity,
                   String sections, Date dateAddProduct) {
        this.series = series;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.comment = comment;
        this.picture = picture;
        this.quantity = quantity;
        this.sections = sections;
        this.dateAddProduct = dateAddProduct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public String getPicture() {
        return picture;
    }
    public void setPicture(String picture) {
        this.picture = picture;
    }
    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public String getComent() {
        return comment;
    }
    public void setComent(String comment) {
        this.comment = comment;
    }
    public String getSections() {
        return sections;
    }
    public void setSections(String sections) {
        this.sections = sections;
    }
    public Date getDateAddProduct() {
        return dateAddProduct;
    }
    public void setDateAddProduct(Date dateAddProduct) {
        this.dateAddProduct = dateAddProduct;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
