package com.cesgroup.agr.controller;

import com.cesgroup.agr.dto.LoginInfos;
import com.cesgroup.agr.entity.BaseEntity;
import com.cesgroup.agr.service.BaseSevice;
import com.cesgroup.agr.service.RedisService;
import com.cesgroup.agr.utils.*;
import com.cesgroup.agr.vo.ObjectForQuery;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * @description: Controller基础类
 */
public class BaseController {

    /** 排序参数名称（create_time,desc;rank,asc）*/
    private static final String ORDER_PARAM = "orders";
    /** 当前页号参数名称（从1开始计数）*/
    private static final String PAGENUMBER_PARAM = "pageNumber";
    /** 每页记录数参数名称 */
    private static final String PAGESIZE_PARAM = "pageSize";
    /** 默认每页记录数 */
     private static final int DEFAULT_PAGESIZE = 20;

    @Autowired
    protected  ExceptionHandler exceptionHandler;
    @Value("${authUrl}")
    private String authUrl;
    //redis中登录信息的key的前缀
    @Value("${redis.key.loginKey}")
    private static final String LOGIN = "login_";
    @Autowired
    private RedisService<LoginInfos> redisService;

    private static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";

    protected Result genSuccessResult() {
        return new Result()
                .setStatus(ResultCode.SUCCESS)
                .setMsg(DEFAULT_SUCCESS_MESSAGE);
    }

    protected Result genSuccessResult(Object data) {
        return new Result()
                .setStatus(ResultCode.SUCCESS)
                .setMsg(DEFAULT_SUCCESS_MESSAGE)
                .setData(data);
    }

    protected Result genFailResult(String message) {
        return new Result()
                .setStatus(ResultCode.FAIL)
                .setMsg(message);
    }

    protected PageRequest buildPageRequest(){
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
        boolean pageQuery = false;
        int pagesize = DEFAULT_PAGESIZE;
        int pageNumber = 1;
        String orderStrs = null;

        if (StringUtils.isNumeric(request.getParameter(PAGESIZE_PARAM))) {
            pagesize = Integer.parseInt(request.getParameter(PAGESIZE_PARAM), 10);
            pageQuery = true;
        }
        if (StringUtils.isNumeric(request.getParameter(PAGENUMBER_PARAM))) {
            pageNumber = Integer.parseInt(request.getParameter(PAGENUMBER_PARAM), 10);
            pageQuery = true;
        }
        if (StringUtils.isNotEmpty(request.getParameter(ORDER_PARAM))) {
            orderStrs = request.getParameter(ORDER_PARAM);
            pageQuery = true;
        }

        if (!pageQuery) {
            return null;
        }

        return SearchHelper.buildPageRequest(pageNumber, pagesize, orderStrs);
    }

    /**
     * 查询实体，可在子类里调用
     * @param formData 包装了查询条件的对象
     */
    public Result query(BaseSevice sevice, ObjectForQuery formData) {
        Result result = genSuccessResult();
        try {
            PageRequest pageRequest = buildPageRequest();
            // 不分页
            if (pageRequest == null) {
                result.setData(sevice.list(formData));
                result.setCount(sevice.list(formData).size());
            // 分页
            } else {
                PageHelper.startPage(pageRequest.getPageNum(), pageRequest.getPageSize());

                sevice.setOrderClause(pageRequest.getOrders());

                List<?> list = sevice.list(formData);
                PageInfo<?> pageInfo = new PageInfo<>(list);

                result.setCount(pageInfo.getTotal());
                result.setData(pageInfo.getList());
            }
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }

        return result;
    }

    /**
     * 查询实体，可在子类里调用
     * @param entityForQuery 包含查询条件的实体
     */
    public Result query(BaseSevice sevice, BaseEntity entityForQuery) {
        Result result = genSuccessResult();
        try {
            PageRequest pageRequest = buildPageRequest();
            // 不分页
            if (pageRequest == null) {
                result.setData(sevice.list(entityForQuery));
            // 分页
            } else {
                PageHelper.startPage(pageRequest.getPageNum(), pageRequest.getPageSize());

                List<?> list = sevice.list(entityForQuery);
                PageInfo<?> pageInfo = new PageInfo<>(list);

                result.setCount(pageInfo.getTotal());
                result.setData(pageInfo.getList());
            }
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }



    /**
     * 获取详细信息
     */
    public Result getDetail(BaseSevice sevice, String id) {
        Result result = genSuccessResult();

        try {
            result.setData(sevice.selectOne(id));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }

        return result;
    }

    /**
     * 新增对象
     * @param sevice
     * @param entity
     * @return
     */
    public Result create(BaseSevice sevice, BaseEntity entity) {
        Result result = genSuccessResult();
        try {
            preCreate(entity);
            result.setData(sevice.insert(entity));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }

    /**
     * 更新对象
     * @param sevice
     * @param entity
     * @return
     */
    public Result update(BaseSevice sevice, BaseEntity entity){
        Result result = genSuccessResult();
        try {
            preUpdate(entity);
            sevice.update(entity);
            result.setData(entity);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }

    /**
     * 删除对象
     * @param sevice
     * @param id
     * @return
     */
    public Result delete(BaseSevice sevice, String id){
        Result result = genSuccessResult();
        try {
            sevice.delete(id);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }

    /**
     * 统计分析，可在子类里调用
     * @param sevice
     * @param formData 包装了查询条件的对象
     * @return
     */
    public Result count(BaseSevice sevice, ObjectForQuery formData) {
        Result result = genSuccessResult();
        try {
            result.setData(sevice.count(formData));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }

        return result;
    }

    /**
     * 统计分析，可在子类里调用
     */
    public Result count(BaseSevice sevice, BaseEntity entityForQuery) {
        Result result = genSuccessResult();
        try {
            result.setData(sevice.count(entityForQuery));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }

        return result;
    }

    /**
     * @description: 获取登录用户信息
     */
    protected LoginInfos getLoginInfos() {
        HttpServletRequest request =  ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        String loginName;
        if(!org.springframework.util.StringUtils.isEmpty(request.getHeader("validParam"))){
            loginName = request.getHeader("validParam");
        } else {
            loginName = request.getParameter("validParam");
        }
        LoginInfos loginInfos = new LoginInfos();
        if(StringUtils.isNotEmpty(loginName)){
            String key = LOGIN+loginName;
            if(redisService.exists(key)){
                BeanUtils.copyProperties(redisService.get(key),loginInfos);
            }else{
                loginInfos = null;
            }
        }
        return loginInfos;
    }

    protected String getLoginUserId(){
        HttpServletRequest request =  ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        String loginUserId;
        if(!org.springframework.util.StringUtils.isEmpty(request.getHeader("loginUserId"))){
            loginUserId = request.getHeader("loginUserId");
        } else {
            loginUserId = request.getParameter("loginUserId");
        }
        return loginUserId;
    }

    protected String getTenantId(){
        HttpServletRequest request =  ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        String tenantId;
        if(!org.springframework.util.StringUtils.isEmpty(request.getHeader("tenantId"))){
            tenantId = request.getHeader("tenantId");
        } else {
            tenantId = request.getParameter("tenantId");
        }
        return tenantId;
    }

    protected void preCreate(BaseEntity entity){
        entity.setCreateUser(getLoginUserId());
    }

    protected void preUpdate(BaseEntity entity){
        entity.setUpdateUser(getLoginUserId());
    }

}
