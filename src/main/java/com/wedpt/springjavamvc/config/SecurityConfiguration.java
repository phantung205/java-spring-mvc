package com.wedpt.springjavamvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.wedpt.springjavamvc.service.CustomUserDetailsService;
import com.wedpt.springjavamvc.service.UserService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    // cài nay sử dụng customse.. tự viết
    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    // nạp vào để dùng
    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        // authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }


    // nghi đè để nó sử dụng funtion của mình
    @Bean
    public AuthenticationSuccessHandler CustomSuccessHandler() {
        return new CustomSuccessHandler();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize

                        .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                DispatcherType.INCLUDE)
                        .permitAll()

                        .requestMatchers("/login", "/", "/product/**",
                                "/client/**", "/css/**", "/js/**",
                                "/images/**")
                        .permitAll()

                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        .anyRequest().authenticated())

                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .successHandler(CustomSuccessHandler())
                        .permitAll())
                //s sử lý khi ko có quyêng hạn
                .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));
        return http.build();
    }

}
