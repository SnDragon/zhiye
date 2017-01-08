package com.scut;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.*;

@SpringBootApplication
@EnableCaching
public class ZhiyeApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZhiyeApplication.class, args);
	}
}
