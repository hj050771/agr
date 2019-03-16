package com.cesgroup.agr.dto;
import java.io.Serializable;
import java.util.Map;

import com.cesgroup.agr.entity.Enterprise;

public class LoginInfos implements Serializable{

    /**登录用户id*/
    private String loginUserId;
    /**姓名*/
    private String name;
    /**令牌*/
    private String token;
    
    /**企业信息*/
    private Enterprise entpInfo;
    
    /**公钥和签名信息*/
    private Map<String,String> keyInfo;

    public String getLoginUserId() {
        return loginUserId;
    }

    public void setLoginUserId(String loginUserId) {
        this.loginUserId = loginUserId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
    
    public Enterprise getEntpInfo() {
		return entpInfo;
	}

	public void setEntpInfo(Enterprise entpInfo) {
		this.entpInfo = entpInfo;
	}

	public Map<String, String> getKeyInfo() {
        return keyInfo;
    }

    public void setKeyInfo(Map<String, String> keyInfo) {
        this.keyInfo = keyInfo;
    }
}
