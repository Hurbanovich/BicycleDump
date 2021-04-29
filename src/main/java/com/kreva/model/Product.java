package com.kreva.model;

import javax.persistence.*;

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

    public Product() {
    }

    public Product(int id, String series, String name, String brand, int price, String comment, int quantity) {
        this.id = id;
        this.series = series;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.comment = comment;
        this.quantity = quantity;
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
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", series='" + series + '\'' +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", coment='" + comment + '\'' +
                ", quantity=" + quantity +
                '}';
    }
}
