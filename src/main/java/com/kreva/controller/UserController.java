package com.kreva.controller;


import com.kreva.model.Product;
import com.kreva.model.User;
import com.kreva.servise.UserService;
import com.kreva.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class UserController {
    private int page;

    @Autowired
    private UserService userService;


    @Autowired
    private UserValidator userValidator;

    @GetMapping(value = "/registration")
    public ModelAndView registration(@ModelAttribute("userForm") User user){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @PostMapping(value = "/registration")
    public ModelAndView registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("registration");
        }else {
            userService.add(userForm);
            modelAndView.setViewName("home");
        }
        return modelAndView;
    }
    @GetMapping(value = "/users")
    public ModelAndView allusers(@RequestParam(defaultValue = "1") int page) {
        List<User> users = userService.allUser(page);
        int userCount = userService.userCount();
        int pagesCount = (userCount + 9)/10;
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("users");
        modelAndView.addObject("page", page);
        modelAndView.addObject("userList", users);
        modelAndView.addObject("userCount", userCount);
        modelAndView.addObject("pagesCount", pagesCount);
        this.page = page;
        return modelAndView;
    }

    @GetMapping(value = "/add")
    public ModelAndView addUser(@ModelAttribute("userForm") User user){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("editUser");
        return modelAndView;
    }

    @PostMapping(value = "/add")
    public ModelAndView addUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("editUser");
        }else {
            userService.addUser(userForm);
            modelAndView.setViewName("users");
        }
        return modelAndView;
    }

    @GetMapping(value="/deleteUser/{id}")
    public ModelAndView deleteFilm(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        int userCount = userService.userCount();
        int page = ((userCount - 1) % 10 == 0 && userCount > 10 && this.page == (userCount + 9) / 10) ?
                this.page - 1 : this.page;
        modelAndView.setViewName("redirect:/users");
        modelAndView.addObject("page", page);
        User user = userService.getByid(id);
        userService.delete(user);
        return modelAndView;
    }
//    @GetMapping(value = "/area/")
//    public ModelAndView area(@RequestParam("user") User logUser){
//        ModelAndView modelAndView = new ModelAndView();
//
//    }
}
