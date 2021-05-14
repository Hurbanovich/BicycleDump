package com.kreva.dao;


import com.kreva.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO{
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> allProduct(int page) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Product ").setFirstResult(10 * (page - 1)).setMaxResults(10).list();
    }

    @Override
    public void add(Product product) {
        Date date = new Date();
        Session session = sessionFactory.getCurrentSession();
        product.setDateAddProduct(date);
        session.persist(product);

    }

    @Override
    public void delete(Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(product);

    }

    @Override
    public void edit(Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.update(product);

    }

    @Override
    public Product getByid(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Product.class, id);
    }

    @Override
    public boolean checkSeries(String series) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Product where series = :series");
        query.setParameter("series", series);
        return query.list().isEmpty();
    }

    @Override
    public int productCount() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select count(*) from Product", Number.class).getSingleResult().intValue();
    }
    @Override
    public void addProduct(Product product, int quantity){
        product.setQuantity(product.getQuantity() + quantity);
    }
}
