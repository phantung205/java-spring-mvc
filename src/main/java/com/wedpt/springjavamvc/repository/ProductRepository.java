package com.wedpt.springjavamvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedpt.springjavamvc.domain.product;

public interface ProductRepository extends JpaRepository<product, Long> {
    product findById(long id);

    void deleteById(long id);
}
