package com.cesgroup.agr.dto;

import com.cesgroup.agr.entity.Accounts;

/**
 * @author: YYB
 * @description:
 * @date: 2018/10/11.
 * @modified by:
 */
public class LoginInfo {
    private Accounts accounts;
    private String authToken;

    public Accounts getAccounts() {
        return accounts;
    }

    public void setAccounts(Accounts accounts) {
        this.accounts = accounts;
    }

    public String getAuthToken() {
        return authToken;
    }

    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }
}
