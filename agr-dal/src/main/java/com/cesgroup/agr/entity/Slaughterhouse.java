package com.cesgroup.agr.entity;

import javax.persistence.*;

public class Slaughterhouse extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 屠宰场编码
     */
    private String code;

    /**
     * 屠宰场名称
     */
    private String name;

    /**
     * @return ep_id
     */
    public String getEpId() {
        return epId;
    }

    /**
     * @param epId
     */
    public void setEpId(String epId) {
        this.epId = epId;
    }

    /**
     * 获取屠宰场编码
     *
     * @return code - 屠宰场编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置屠宰场编码
     *
     * @param code 屠宰场编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取屠宰场名称
     *
     * @return name - 屠宰场名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置屠宰场名称
     *
     * @param name 屠宰场名称
     */
    public void setName(String name) {
        this.name = name;
    }
}