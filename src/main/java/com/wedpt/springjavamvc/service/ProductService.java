package com.wedpt.springjavamvc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.wedpt.springjavamvc.domain.Cart;
import com.wedpt.springjavamvc.domain.CartDetail;
import com.wedpt.springjavamvc.domain.User;
import com.wedpt.springjavamvc.domain.product;
import com.wedpt.springjavamvc.repository.CartRepository;
import com.wedpt.springjavamvc.repository.CartdetailRepository;
import com.wedpt.springjavamvc.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartdetailRepository cartdetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartdetailRepository cartdetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartdetailRepository = cartdetailRepository;
        this.userService = userService;
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

    public void handleAddProductToCart(String email, Long productId, HttpSession session) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đã có cart hay chưa ? nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // craete cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartRepository.save(otherCart);
            }

            // save cart_detail
            // tìm product by id
            Optional<product> productOptional = this.productRepository.findById(productId);

            if (productOptional.isPresent()) {
                product realproduct = productOptional.get();

                // chech sản phẩm đã từng được thêm vào giỏ hàng hay chưa?
                CartDetail oldDetail = this.cartdetailRepository.findByCartAndProduct(cart, realproduct);
                //

                if (oldDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(realproduct);
                    cartDetail.setQuantity((long) 1);
                    cartDetail.setPrice(realproduct.getPrice());

                    this.cartdetailRepository.save(cartDetail);

                    // update cart (sum)
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartdetailRepository.save(oldDetail);
                }

            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

}
