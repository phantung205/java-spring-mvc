package com.wedpt.springjavamvc.domain.DTO;

import com.wedpt.springjavamvc.service.validator.RegisterChecked;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {
    @Size(min = 3, message = "tên phải lớn hơn 3 ký tự")
    private String firstName;

    private String lastName;

    @Email(message = "Email is not valid", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    private String password;

    @Size(min = 3, message = "comfirmpassword phải lớn hơn 3 ký tự")
    private String comfirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getComfirmPassword() {
        return comfirmPassword;
    }

    public void setComfirmPassword(String comfirmPassword) {
        this.comfirmPassword = comfirmPassword;
    }

}
