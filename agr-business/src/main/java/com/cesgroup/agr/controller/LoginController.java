package com.cesgroup.agr.controller;

import com.cesgroup.agr.entity.Accounts;
import com.cesgroup.agr.exceptions.ServiceException;
import com.cesgroup.agr.service.AccountsService;
import com.cesgroup.agr.utils.Result;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 */
@RestController
public class LoginController extends BaseController{

    @Autowired
    private AccountsService accountsService;

    @PostMapping("/login")
    public Result login( Accounts accounts){
        Result result = genSuccessResult();
        try {
            result.setData(accountsService.login(accounts));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }


    @PostMapping("/register")
    public Result register(@RequestBody Accounts account){
        Result result = genSuccessResult();
        try {
            if(StringUtils.isEmpty(account.getLoginName())){
                throw new ServiceException("手机号不能为空！");
            }
            if(accountsService.selectByLoginName(account.getLoginName())==null){
                result.setData(accountsService.insert(account));
            }else{
                throw new ServiceException("手机号已被注册！");
            }
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }


    @PostMapping("/changePassword")
    public Result changePassword(@RequestBody Accounts accounts){
        Result result = genSuccessResult();
        try {
            if(StringUtils.isEmpty(accounts.getId())){
                throw new ServiceException("请先登录！");
            }
            if(StringUtils.isEmpty(accounts.getPassword())){
                throw new ServiceException("请输入新密码！");
            }
            accountsService.changePassword(accounts.getId(),accounts.getPassword());
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }

    /**
     * @description: 获取企业信息
     */
    @GetMapping("/account/{id}")
    public Result getAccount(@PathVariable("id")String id){
        Result result = genSuccessResult();
        try {
            result.setData(accountsService.selectById(id));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }

    /**
     * @description: 更新用户信息
     */
    @PatchMapping("/account/{id}")
    public Result updateAccount(@PathVariable("id")String id,@RequestBody Accounts account){
        Result result = genSuccessResult();
        try {
            result.setData(accountsService.update(id,account));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
}
