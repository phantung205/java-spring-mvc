package com.wedpt.springjavamvc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.wedpt.springjavamvc.domain.User;
import com.wedpt.springjavamvc.domain.role;
import com.wedpt.springjavamvc.domain.DTO.RegisterDTO;
import com.wedpt.springjavamvc.repository.RoleRepository;
import com.wedpt.springjavamvc.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    // public String handlHome() {
    // return "hello service";
    // }

    // get all user
    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    // get all user by email
    // public List<User> getAllUserByEmail(String Email) {
    // return this.userRepository.findByEmail(Email);
    // }

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

    // get role by name
    public role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User RegisterDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullname(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setPassword(registerDTO.getPassword());
        user.setEmail(registerDTO.getEmail());
        return user;
    }

    // get user by name email
    public User getUserByEmail(String Email) {
        return this.userRepository.findByEmail(Email);
    }
}
