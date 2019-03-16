package com.cesgroup.agr.controller;

import com.cesgroup.agr.service.TokenService;
import com.cesgroup.agr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:TokenController
 */
@RestController
public class TokenController extends BaseController {

    @Autowired
    private TokenService tokenService;

    @GetMapping("/getToken")
    public Result getToken(@RequestParam("userName")String userName,@RequestParam("password")String password){
        Result result = genSuccessResult();
        try {
            result.setData(tokenService.getToken(userName,password));
        }catch (Exception e){
            result = exceptionHandler.handleException(e);
        }
        return result;
    }

}
