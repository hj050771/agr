package com.cesgroup.agr.interceptor;

import com.cesgroup.agr.constant.EntityConsts;
import com.cesgroup.agr.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description: 请求拦截器
 */
public class ApiInterceptor implements HandlerInterceptor {

    @Autowired
    private TokenService tokenService;

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
        // 验证token过程
        if(!httpServletRequest.getRequestURI().contains("/electronic_certificate") && !httpServletRequest.getRequestURI().contains("/getToken")){
            String authToken = httpServletRequest.getParameter("authToken");
            if(StringUtils.isEmpty(authToken)){
                httpServletResponse.getWriter().write("authToken!");
                return false;
            }
            int tokenStatus = tokenService.validateToken(authToken);
            if(EntityConsts.TOKEN_EXPIRE == tokenStatus){
                httpServletResponse.getWriter().write("expired");
                return false;
            }else if(EntityConsts.TOKEN_INVALID == tokenStatus){
                httpServletResponse.getWriter().write("invalid");
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
