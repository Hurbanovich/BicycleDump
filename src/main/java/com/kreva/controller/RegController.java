package com.kreva.controller;


import com.kreva.model.User;
import com.kreva.servise.UserService;
import com.kreva.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RegController {

    @Autowired
    private UserService userService;


    @Autowired
    private UserValidator userValidator;


    @GetMapping(value = "/registration")
    public ModelAndView registration(@ModelAttribute("userForm") User user){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/registration");
        return modelAndView;
    }

    @PostMapping(value = "/registration")
    public ModelAndView registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("/registration");
        }else {
            userService.add(userForm);
            modelAndView.setViewName("/home");
        }
        return modelAndView;
    }



}
