package com.cesgroup.agr.service;

import com.cesgroup.agr.constant.EntityConsts;
import com.cesgroup.agr.entity.Accounts;
import com.cesgroup.agr.entity.Enterprise;
import com.cesgroup.agr.exceptions.ServiceException;
import com.cesgroup.agr.utils.*;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Calendar;

/**
 * @description:
 */
@Service
public class TokenService {
    private final static Logger LOGGER = LoggerFactory.getLogger(TokenService.class);

    @Value("${authUrl}")
    private String authUrl;

    @Value("${encodeRules}")
    private String encodeRules;

    @Autowired
    private EnterpriseService enterpriseService;
    @Autowired
    private AccountsService accountsService;

    public String getToken(String userName, String password) throws Exception {
        Accounts account = accountsService.selectByLoginName(userName);
        if (StringUtils.isEmpty(account.getId())) {
            throw new ServiceException("用户不存在！");
        } else {
           /* byte[] salt = Encodes.decodeHex(account.getSalt());
            String encodePassword = new SimpleHash("SHA-1", password, ByteSource.Util.bytes(salt), 1024).toHex();*/
            //查询到的账户密码不等于用户输入的密码
            if (!account.getPassword().equals(password)) {
                throw new ServiceException("密码错误！");
            } else if (account.getDeleteFlg().equals(Status.FREEZEN)) {
                throw new ServiceException("用户已被冻结！");
            }
        }
        
        String encodeStr = SHA256Util.getSHA256Str(account.getEpId());
        StringBuffer str = new StringBuffer("");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.HOUR_OF_DAY,1);
        str.append(account.getId()).append(",").append(encodeStr).append(",").append(cal.getTimeInMillis());
        String authToken = EncrypAES.encrypt(str.toString(),encodeRules);
        LOGGER.info("加密后的密文:"+authToken);
        return authToken;
    }

    /**
     * @description: 
     * @return: 1:验证通过 0:失败 2:token过期
     */
    public int validateToken(String authToken) throws Exception {
        authToken = authToken.replace(" ","+");
        LOGGER.info("验证开始:"+authToken+"-"+encodeRules);
        String dnCode  = EncrypAES.decrypt(authToken,encodeRules);
        LOGGER.info("解密后的明文:"+dnCode);
        String accountId = dnCode.split(",")[0];
        String encodeStr = dnCode.split(",")[1];
        long validTime = Long.parseLong(dnCode.split(",")[2]);
        Enterprise entpInfo = enterpriseService.queryByUserId(accountId);
        if(Calendar.getInstance().getTimeInMillis()>=validTime){
            return EntityConsts.TOKEN_EXPIRE;
        }
        if(encodeStr.equals(SHA256Util.getSHA256Str(entpInfo.getId()))){
            return EntityConsts.TOKEN_OK;
        }
        return EntityConsts.INVALID;
    }

    public Enterprise getEntpInfoDto(String authToken) throws Exception {
        authToken = authToken.replace(" ","+");
        String dnCode  = EncrypAES.decrypt(authToken,encodeRules);
        String accountId = dnCode.split(",")[0];
        return enterpriseService.queryByUserId(accountId);
    }
}
