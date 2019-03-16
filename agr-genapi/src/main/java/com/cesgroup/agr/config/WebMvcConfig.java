package com.cesgroup.agr.config;

import com.cesgroup.agr.interceptor.ApiInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @date: MVC配置
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter{

    @Bean
    ApiInterceptor apiInterceptor(){
        return new ApiInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(apiInterceptor()).addPathPatterns("/api/**");
        super.addInterceptors(registry);
    }

}
