package com.wedpt.springjavamvc.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.wedpt.springjavamvc.domain.User;
import com.wedpt.springjavamvc.domain.product;
import com.wedpt.springjavamvc.domain.DTO.RegisterDTO;
import com.wedpt.springjavamvc.service.ProductService;
import com.wedpt.springjavamvc.service.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {
        List<product> products = productService.getAllProduct();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    // register
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.RegisterDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(registerDTO.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        // save
        this.userService.handlSaveUser(user);
        return "redirect:/login";
    }

    // login
    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }
}
