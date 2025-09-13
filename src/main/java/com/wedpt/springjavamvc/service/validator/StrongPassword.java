package com.wedpt.springjavamvc.service.validator;

import java.lang.annotation.*;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Constraint(validatedBy = StrongPasswordvalidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface StrongPassword {
    String message()

    default "Must be 8 characters long and combination of uppercase letters, lowercase letters, numbers, special characters.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
