package com.cesgroup.agr.utils;

import com.cesgroup.agr.exceptions.ServiceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ExceptionHandler {
    private final static Logger LOGGER = LoggerFactory.getLogger(ExceptionHandler.class);

    public Result handleException(Exception e){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        Result result = new Result();
        if (e instanceof ServiceException) {//业务失败的异常，如“账号或密码错误”
            result.setStatus(ResultCode.FAIL).setMsg(e.getMessage());
        } else if (e instanceof NoHandlerFoundException) {
            result.setStatus(ResultCode.NOT_FOUND).setMsg("接口 [" + request.getRequestURI() + "] 不存在");
        } else if (e instanceof ServletException) {
            result.setStatus(ResultCode.FAIL).setMsg(e.getMessage());
        } else {
            result.setStatus(ResultCode.INTERNAL_SERVER_ERROR).setMsg("接口 [" + request.getRequestURI() + "] 内部错误，请联系管理员");
        }
        LOGGER.error(result.getMsg(),e);
        return result;
    }
}
