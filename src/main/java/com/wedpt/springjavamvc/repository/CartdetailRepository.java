package com.wedpt.springjavamvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wedpt.springjavamvc.domain.Cart;
import com.wedpt.springjavamvc.domain.CartDetail;
import com.wedpt.springjavamvc.domain.product;
import java.util.List;

@Repository
public interface CartdetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, product product);

    CartDetail findByCartAndProduct(Cart cart, product product);

}
