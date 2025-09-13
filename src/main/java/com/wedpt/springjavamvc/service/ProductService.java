package com.wedpt.springjavamvc.service;

import java.util.List;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.springframework.stereotype.Service;

import com.wedpt.springjavamvc.domain.product;
import com.wedpt.springjavamvc.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public void handleSaveProduct(product product) {
        this.productRepository.save(product);
    }

    public List<product> getAllProduct() {
        return this.productRepository.findAll();
    }

    // detail product by id
    public product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    // delete product by id
    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }
}
