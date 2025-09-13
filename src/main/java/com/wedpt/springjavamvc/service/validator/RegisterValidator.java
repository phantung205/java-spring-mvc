package com.wedpt.springjavamvc.service.validator;

import com.wedpt.springjavamvc.domain.DTO.RegisterDTO;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;
        // check if password fields match
        if (!user.getPassword().equals(user.getComfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords input enter error")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // additional validations can be added here
        return valid;
    }

}
