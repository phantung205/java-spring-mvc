package com.wedpt.springjavamvc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.wedpt.springjavamvc.domain.product;
import com.wedpt.springjavamvc.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

}
