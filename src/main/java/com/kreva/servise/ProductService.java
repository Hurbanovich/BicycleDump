package com.kreva.servise;



import com.kreva.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> allProduct(int page);
    void add(Product product);
    void delete(Product product);
    void edit(Product product);
    Product getById(int id);
    public boolean checkSeries(String series);
    void addProduct(Product product, int quantity);

    int productCount();

    List<Product> allProductFilter(String sections);
}
