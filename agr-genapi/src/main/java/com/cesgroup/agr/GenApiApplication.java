package com.cesgroup.agr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan(basePackages = {"com.cesgroup.agr.mapper"})
public class GenApiApplication {
    public static void main(String[] args) {
        SpringApplication.run(GenApiApplication.class, args);
    }
}
