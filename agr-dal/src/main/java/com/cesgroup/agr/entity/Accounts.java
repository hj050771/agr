package com.cesgroup.agr.entity;

import javax.persistence.*;

public class Accounts extends BaseEntity {
    /**
     * 所属农贸市场
     */
    @Column(name = "ep_id")
    private String epId;

    /**
     * 姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 用户名
     */
    @Column(name = "login_name")
    private String loginName;

    /**
     * 密码
     */
    private String password;

    /**
     * 获取所属农贸市场
     *
     * @return ep_id - 所属农贸市场
     */
    public String getEpId() {
        return epId;
    }

    /**
     * 设置所属农贸市场
     *
     * @param epId 所属农贸市场
     */
    public void setEpId(String epId) {
        this.epId = epId;
    }

    /**
     * 获取姓名
     *
     * @return user_name - 姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置姓名
     *
     * @param userName 姓名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取用户名
     *
     * @return login_name - 用户名
     */
    public String getLoginName() {
        return loginName;
    }

    /**
     * 设置用户名
     *
     * @param loginName 用户名
     */
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }
}