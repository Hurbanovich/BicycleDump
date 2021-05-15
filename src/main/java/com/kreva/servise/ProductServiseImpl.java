package com.kreva.servise;


import com.kreva.dao.ProductDAO;
import com.kreva.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiseImpl implements ProductService{
    private ProductDAO productDAO;

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Override
    @Transactional
    public List<Product> allProduct(int page) {
        return productDAO.allProduct(page);
    }

    @Override
    @Transactional
    public void add(Product product) {
        productDAO.add(product);

    }

    @Override
    @Transactional
    public void delete(Product product) {
        productDAO.delete(product);

    }

    @Override
    @Transactional
    public void edit(Product product) {
        productDAO.edit(product);

    }

    @Override
    @Transactional
    public Product getById(int id) {
        return productDAO.getByid(id);
    }

    @Override
    @Transactional
    public boolean checkSeries(String series) {
        return productDAO.checkSeries(series);
    }

    @Override
    @Transactional
    public void addProduct(Product product, int quantity) {
        productDAO.addProduct(product,quantity);
    }

    @Override
    @Transactional
    public int productCount() {
        return productDAO.productCount();
    }

    @Override
    @Transactional
    public List<Product> allProductFilter(String sections) {
        return productDAO.allProductFilter(sections);
    }
}
