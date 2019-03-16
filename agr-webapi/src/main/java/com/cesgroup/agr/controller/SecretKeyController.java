package com.cesgroup.agr.controller;


import com.cesgroup.agr.service.SecretKeyService;
import com.cesgroup.agr.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SecretKeyController extends BaseController {
    private final static Logger logger = LoggerFactory.getLogger(SecretKeyController.class);

    @Autowired
    private SecretKeyService secretKeyService;

    @GetMapping("/v1/secret_key/{epId}")
    public Result refresh(@PathVariable("epId")String epId){
        Result result = genSuccessResult();
        try {
            result.setData(secretKeyService.getKeyInfo(epId));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
}
