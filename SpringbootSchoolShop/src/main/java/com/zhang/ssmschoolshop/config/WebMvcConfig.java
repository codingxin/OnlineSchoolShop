package com.zhang.ssmschoolshop.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 * @author created by CodingZhangxin
 * @version v.0.1
 * @Description TODO
 * @date 2019/5/10
 * @备注  springboot内置tomcat配置虚拟路径
 *      linux： /usr/upload  /pictures
 *      window:  d:/upload  /pictures
 **/

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {



    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String os = System.getProperty("os.name");
        String pathPatterns="/pictures/**";
        String pathAbsolute="file:D:/upload/";
        if (os.toLowerCase().startsWith("linux")){
            pathAbsolute="file:/usr/upload/";
        }
        registry.addResourceHandler(pathPatterns).addResourceLocations(pathAbsolute);

    }

}