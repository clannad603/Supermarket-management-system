package com.huangrui.hr_smms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class HrSmmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(HrSmmsApplication.class, args);
    }

}
