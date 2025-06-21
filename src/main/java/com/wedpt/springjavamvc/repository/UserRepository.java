package com.wedpt.springjavamvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wedpt.springjavamvc.domain.User;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User phantung);

    void deleteById(long id);

    List<User> findByEmail(String email);

    User findById(long id);
}
