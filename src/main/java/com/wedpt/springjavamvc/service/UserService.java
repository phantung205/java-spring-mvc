package com.wedpt.springjavamvc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.wedpt.springjavamvc.domain.User;
import com.wedpt.springjavamvc.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // public String handlHome() {
    // return "hello service";
    // }

    // get all user
    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    // get all user by email
    public List<User> getAllUserByEmail(String Email) {
        return this.userRepository.findByEmail(Email);
    }

    // create user
    public User handlSaveUser(User phantung) {
        User it = this.userRepository.save(phantung);
        return it;
    }

    // get detail user by id
    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    // delete use by id
    public void deleteById(long id) {
        this.userRepository.deleteById(id);
    }

}
