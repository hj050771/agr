package com.cesgroup.agr.controller;

import com.cesgroup.agr.service.LoginInfoService;
import com.cesgroup.agr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 */
@RestController
public class LoginController extends BaseController{

    @Autowired
    private LoginInfoService loginInfoService;

    @PostMapping("/login")
    public Result login(String loginName, String password){
		return null;
    }

    @PostMapping("/changePassword")
    public Result changePassword(@RequestParam("loginUserId") String loginUserId, @RequestParam("password") String password){
		return null;
    }
}
