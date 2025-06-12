package com.wedpt.springjavamvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.wedpt.springjavamvc.domain.User;
import com.wedpt.springjavamvc.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("/")
    public String getHomePage(Model  model ){
        String test = userService.handlHome();
        model.addAttribute("phantungit",test);
        model.addAttribute("name", "abc");
        return "hello";
    }
    @RequestMapping("/admin/user")
    public String getUserPage(Model  model){
        model.addAttribute("newUser",new User());
        return "admin/user/create";
    }
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model,@ModelAttribute("newUser") User phantungit){
        System.out.println("run here"+phantungit);
        return "hello";
    }     

}

