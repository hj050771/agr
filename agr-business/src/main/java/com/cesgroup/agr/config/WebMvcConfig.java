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
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter{

    @Bean
    ClientInterceptor clientInterceptor(){
        return new ClientInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(clientInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }

}
