package com.cesgroup.agr.config;

import com.cesgroup.agr.interceptor.ClientInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @description: MVC配置
 * @return: 
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter{

    @Value("${uploadPath}")
    private String uploadPath;

    @Bean
    ClientInterceptor clientInterceptor(){
        return new ClientInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(clientInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**").addResourceLocations("file:"+uploadPath);
        super.addResourceHandlers(registry);
    }  
}
