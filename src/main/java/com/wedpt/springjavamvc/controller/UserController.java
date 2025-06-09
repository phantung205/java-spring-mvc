package com.wedpt.springjavamvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wedpt.springjavamvc.service.UserService;


@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("/")
    public String getHomePage(){
        String test = userService.handlHome();
        return "hello";
    }

}
// @RestController
// public class UserController {


//     private UserService userService;

//     public UserController(UserService userService) {
//         this.userService = userService;
//     }
    

//     @GetMapping("/")
//     public String getHomePage(){
//         return " this home page" ;
//     }
// }
