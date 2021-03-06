package com.kreva.servise;

import com.kreva.model.User;

import java.util.List;

public interface UserService {
    List<User> allUser(int page);
    void add(User user);
    void delete(User user);
    void edit(User user);
    User getByid(int id);
    boolean checkEmail(String Email);

    int userCount();

    boolean checkUsername(String username);

    void addUser(User userForm);
}
