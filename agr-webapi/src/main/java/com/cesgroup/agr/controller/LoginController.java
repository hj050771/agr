package com.cesgroup.agr.controller;

import com.cesgroup.agr.service.LoginInfoService;
import com.cesgroup.agr.utils.Result;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

/**
 * @author: YYB
 * @description:
 * @date: 2018/3/14.
 * @modified by:
 */
@RestController
public class LoginController extends BaseController{

    @Autowired
    private LoginInfoService loginInfoService;

    @Autowired
    private DefaultKaptcha defaultKaptcha;

    @PostMapping("/login")
    public Result login(String loginName, String password){
        Result result = genSuccessResult();
        try {
            result.setData(loginInfoService.login(loginName,password));
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
//    @PostMapping("/changePassword")
//    public Result changePassword(@RequestParam("loginUserId") String loginUserId, @RequestParam("password") String password){
//        Result result = genSuccessResult();
//        try {
//        //    loginInfoService.changePassword(loginUserId,password);
//        } catch (Exception e) {
//            result = exceptionHandler.handleException(e);
//        }
//        return result;
//    }
    @GetMapping("/validateCode")
    public void getValidateCode(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception{
        byte[] captchaChallengeAsJpeg = null;

        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try {
            //生产验证码字符串并保存到redis中
            String codeId = httpServletRequest.getParameter("codeId");
            String validateCode = defaultKaptcha.createText();
            loginInfoService.storageValidateCode(codeId,validateCode);
            //使用生产的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
            BufferedImage challenge = defaultKaptcha.createImage(validateCode);
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            httpServletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        //定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream =
                httpServletResponse.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }



}
