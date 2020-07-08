package com.project.wjl.fcserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class FcServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(FcServerApplication.class, args);
	}

}
