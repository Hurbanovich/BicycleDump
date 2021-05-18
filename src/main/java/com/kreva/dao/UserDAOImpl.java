package com.kreva.dao;


import com.kreva.model.Role;
import com.kreva.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;


import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Repository
public class UserDAOImpl implements UserDAO{

    private SessionFactory sessionFactory;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> allUser(int page) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from User ").setFirstResult(10 * (page - 1)).setMaxResults(10).list();

    }

    @Override
    public void add(User user) {
        Session session = sessionFactory.getCurrentSession();
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Role role = session.load(Role.class,1L);
        Set<Role> roles = new HashSet<>();
        roles.add(role);
        user.setRoles(roles);
        System.out.println(user.getId());
        System.out.println(user.getUsername());
        System.out.println(user.getEmail());
        System.out.println(user.getPassword());
        System.out.println(user.getRoles());;

        session.persist(user);

    }

    @Override
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Role role;
        if(user.getSerialization() == 2){
            role = session.load(Role.class,2L);
        }else {
             role = session.load(Role.class,3L);
        }
        Set<Role> roles = new HashSet<>();
        roles.add(role);
        user.setRoles(roles);
        System.out.println(user.getId());
        System.out.println(user.getUsername());
        System.out.println(user.getEmail());
        System.out.println(user.getPassword());
        System.out.println(user.getRoles());;

        session.persist(user);

    }

    @Override
    public void delete(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }

    @Override
    public void edit(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public User getByid(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(User.class, id);
    }

    @Override
    public boolean checkEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where email = :email");
        query.setParameter("email", email);
        return query.list().isEmpty();
    }


    @Override
    public int userCount() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select count(*) from User ", Number.class).getSingleResult().intValue();
    }

    @Override
    public boolean checkUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where username = :username");
        query.setParameter("username", username);
        return query.list().isEmpty();
    }
}
