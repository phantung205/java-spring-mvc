package com.wedpt.springjavamvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// include bao gom >< exclude loai bo
// @SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
@SpringBootApplication
public class SpringjavamvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringjavamvcApplication.class, args);
	}

}
