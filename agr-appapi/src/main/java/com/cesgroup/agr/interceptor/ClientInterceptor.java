package com.cesgroup.agr.interceptor;

import com.cesgroup.agr.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description: PC客户端请求拦截器
 */
public class ClientInterceptor implements HandlerInterceptor {

    @Autowired
    private RedisService redisService;

    //redis中用户token的key的前缀
    private static final String TOKEN = "token_";

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //在请求处理之前进行调用（Controller方法调用之前）
        //设置允许跨域的配置
        // 这里填写你允许进行跨域的主机ip（正式上线时可以动态配置具体允许的域名和IP）
        httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
        // 允许的访问方法
        httpServletResponse.setHeader("Access-Control-Allow-Methods","POST, GET, PUT, OPTIONS, DELETE, PATCH");
        // Access-Control-Max-Age 用于 CORS 相关配置的缓存
        httpServletResponse.setHeader("Access-Control-Max-Age", "3600");
        httpServletResponse.setHeader("Access-Control-Allow-Headers","authToken,validParam,loginUserId,tenantId,Origin,X-Requested-With,Content-Type,Accept");
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json; charset=utf-8");
        //若不是登录请求则进行token校验（目前是从redis中取出后进行Base64比对）
        if(!httpServletRequest.getRequestURI().contains("/login") && !httpServletRequest.getRequestURI().contains("/validateCode")){
            String authToken;
            if(!StringUtils.isEmpty(httpServletRequest.getHeader("authToken"))){
                authToken = httpServletRequest.getHeader("authToken");
            } else {
                authToken = httpServletRequest.getParameter("authToken");
            }
            String loginName;
            if(!StringUtils.isEmpty(httpServletRequest.getHeader("validParam"))){
                loginName = httpServletRequest.getHeader("validParam");
            } else {
                loginName = httpServletRequest.getParameter("validParam");
            }
            Object obj = redisService.get(TOKEN+loginName);
            String unEncodeToken = (String) obj;
            String encodeToken = new String(Base64Utils.encode(unEncodeToken.getBytes()));
            if(!encodeToken.equals(authToken)){
                httpServletResponse.getWriter().write("401");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //在视图被渲染之前（Controller方法调用之后）
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //渲染了对应的视图之后执行（主要是用于进行资源清理工作）
    }
}
