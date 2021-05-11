package com.kreva.servise;


import com.kreva.dao.UserDAO;
import com.kreva.model.Role;
import com.kreva.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Collections;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional
    public List<User> allUser(int page) {
        return userDAO.allUser(page);
    }

    @Override
    @Transactional
    public void add(User user) {
        userDAO.add(user);

    }

    @Override
    @Transactional
    public void delete(User user) {
        userDAO.delete(user);

    }

    @Override
    @Transactional
    public void edit(User user) {
        userDAO.edit(user);

    }

    @Override
    @Transactional
    public User getByid(int id) {
        return userDAO.getByid(id);
    }

    @Override
    @Transactional
    public boolean checkEmail(String email) {
        return userDAO.checkEmail(email);
    }

    @Override
    @Transactional
    public int userCount() {
        return userDAO.userCount();
    }

    @Override
    @Transactional
    public  boolean checkUsername(String username) {
        return userDAO.checkUsername(username);
    }


}
