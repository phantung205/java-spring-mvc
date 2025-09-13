package com.wedpt.springjavamvc.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.wedpt.springjavamvc.domain.User;
import com.wedpt.springjavamvc.domain.product;
import com.wedpt.springjavamvc.service.ProductService;
import com.wedpt.springjavamvc.service.UploadService;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService,
            ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postMethodName(Model model, @ModelAttribute("newProduct") @Valid product phantung,
            BindingResult newUserBindingResult, @RequestParam("phantungitFile") MultipartFile file) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        //
        String avatar = this.uploadService.handleSaveUploadFile(file, "product");
        phantung.setImage(avatar);
        productService.handleSaveProduct(phantung);
        return "redirect:/admin/product";
    }

    // detail product by Id
    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    // delete product by id
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new product());
        return "/admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") User phantungit) {
        this.productService.deleteProductById(phantungit.getId());
        return "redirect:/admin/product";
    }

    // update product
    @RequestMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        product currentProduct = this.productService.getProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("newProduct") @Valid product phantung,
            BindingResult newUserBindingResult, @RequestParam("phantungitFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/product/update";
        }

        product productCurrent = this.productService.getProductById(phantung.getId());
        if (productCurrent != null) {
            // update new image
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                productCurrent.setImage(img);
            }
            productCurrent.setName(phantung.getName());
            productCurrent.setPrice(phantung.getPrice());
            productCurrent.setQuantity(phantung.getQuantity());
            productCurrent.setDetailDesc(phantung.getDetailDesc());
            productCurrent.setShortdesc(phantung.getShortdesc());
            productCurrent.setFactory(phantung.getFactory());
            productCurrent.setTarget(phantung.getTarget());

            this.productService.handleSaveProduct(productCurrent);

        }
        return "redirect:/admin/product";
    }

}
