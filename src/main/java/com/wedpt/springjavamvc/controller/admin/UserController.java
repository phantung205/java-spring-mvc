package com.wedpt.springjavamvc.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;

import com.wedpt.springjavamvc.domain.User;

import com.wedpt.springjavamvc.service.UploadService;
import com.wedpt.springjavamvc.service.UserService;

import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private final PasswordEncoder passwordEncoder;
    private final UserService userService;
    private final UploadService uploadService;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // page home
    // @GetMapping("/")
    // public String getHomePage(Model model) {
    // List<User> arrUser = this.userService.getAllUserByEmail("1@gmail.com");
    // System.out.println(arrUser);
    // model.addAttribute("phantungit", "fffff");
    // model.addAttribute("name", "abc");
    // return "hello";
    // }

    // page form create user
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // form action this url
    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") User phantungit,
            @RequestParam("phantungitFile") MultipartFile file) {
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(phantungit.getPassword());

        phantungit.setPassword(hashPassword);
        phantungit.setAvatar(avatar);
        phantungit.setRole(this.userService.getRoleByName(phantungit.getRole().getName()));
        this.userService.handlSaveUser(phantungit);
        return "redirect:/admin/user";
    }

    // show all user
    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = userService.getAllUser();
        model.addAttribute("users1", users);
        return "admin/user/show";
    }

    // get user by id
    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    // update user
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    // click update user
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User phantungit) {
        User currentUser = userService.getUserById(phantungit.getId());
        if (currentUser != null) {
            currentUser.setFullname(phantungit.getFullname());
            currentUser.setPhone(phantungit.getPhone());
            currentUser.setAddress(phantungit.getAddress());
            this.userService.handlSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // delete a user
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User phantungit) {
        this.userService.deleteById(phantungit.getId());
        return "redirect:/admin/user";
    }
}
