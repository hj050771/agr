package com.cesgroup.agr.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;
import org.apache.commons.lang3.StringUtils;

//import com.cesgroup.authen4.ws.CoreHttpClientWS;
import com.cesgroup.agr.dto.LoginInfos;
import com.cesgroup.agr.entity.Accounts;
import com.cesgroup.agr.entity.Enterprise;
import com.cesgroup.agr.exceptions.ServiceException;
import com.cesgroup.agr.utils.Status;

@Service
@Transactional(readOnly = true)
public class LoginInfoService extends BaseSevice {

    public static final String CLIENT_PC = "PC";
    public static final String CLIENT_APP = "APP";

    @Value("${pmsSystemId}")
    private String pmsSystemId;

    @Value("${zhfwSystemId}")
    private String zhfwSystemId;

    //redis中用户token的key的前缀
    @Value("${redis.key.tokenKey}")
    private String TOKEN;
    //redis中登录信息的key的前缀
    @Value("${redis.key.loginKey}")
    private String LOGIN;

    @Value("${authUrl}")
    private String authUrl;


    @Autowired
    private SecretKeyService secretKeyService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private AccountsService accountsService;
    @Autowired
    private EnterpriseService enterpriseService;
    
    /**
     */
    @Transactional
    public synchronized LoginInfos login(String loginName, String password) {
        Accounts account = accountsService.selectByLoginName(loginName);
        LoginInfos loginInfos = new LoginInfos();
        if (StringUtils.isEmpty(account.getId())) {
            throw new ServiceException("用户名或密码不正确");
        } else {
            //查询到的账户密码不等于用户输入的密码
            if (!account.getPassword().equals(password)) {
                throw new ServiceException("用户名或密码不正确");
            } else if (account.getDeleteFlg().equals(Status.FREEZEN)) {
                throw new ServiceException("用户名或密码不正确");
            }
            loginInfos.setLoginUserId(account.getId());
            loginInfos.setName(account.getUserName());

            //生成token
            String token = UUID.randomUUID().toString().replace("-", "");
            String key = TOKEN + account.getLoginName();
            redisService.set(key,token);
            //返回给前端的话进行Base64加密
            loginInfos.setToken(new String(Base64Utils.encode(token.getBytes())));
            //组织信息
            Enterprise entpInfo = enterpriseService.selectOne(account.getEpId());
            loginInfos.setEntpInfo(entpInfo);
            //返回公钥和签名
            loginInfos.setKeyInfo(secretKeyService.getKeyInfo(entpInfo.getId()));
            //将登录信息存入redis
            key = LOGIN + account.getLoginName();
            redisService.set(key, loginInfos);
        }
        return loginInfos;
    }


    /**
     * @description: 修改密码
     */
    /*public void changePassword(String userId,String password){
        CoreHttpClientWS coreHttpClientWS = CoreHttpClientWS.getCoreHttpClientWS(authUrl);
        int result =  coreHttpClientWS.changePassword(userId,password);
        if(result!=1){
            throw new ServiceException("修改密码失败！");
        }
    }*/

    /**
     * @description: 将验证码存入redis
     */
    public void storageValidateCode(String key,String validateCode){
        redisService.set(key, validateCode, 1l);
    }

}
