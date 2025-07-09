package com.wedpt.springjavamvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedpt.springjavamvc.domain.role;

public interface RoleRepository extends JpaRepository<role, Long> {
    role findByName(String name);
}
