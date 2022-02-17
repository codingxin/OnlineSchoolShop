package com.zhang.ssmschoolshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
@MapperScan("com.zhang.ssmschoolshop.dao")
public class SpringbootSchoolShopApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(SpringbootSchoolShopApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringbootSchoolShopApplication.class, args);
    }


    @Bean
    public MailSender mailSender(){
        return new MailSender() {
            @Override
            public void send(SimpleMailMessage simpleMailMessage) throws MailException {

            }

            @Override
            public void send(SimpleMailMessage... simpleMailMessages) throws MailException {

            }
        };
    }

}
