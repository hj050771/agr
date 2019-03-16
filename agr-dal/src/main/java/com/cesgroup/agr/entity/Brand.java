package com.cesgroup.agr.entity;

import javax.persistence.*;

public class Brand extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 品牌代码
     */
    private String code;

    /**
     * 品牌名称
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
     * 获取品牌代码
     *
     * @return code - 品牌代码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置品牌代码
     *
     * @param code 品牌代码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取品牌名称
     *
     * @return name - 品牌名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置品牌名称
     *
     * @param name 品牌名称
     */
    public void setName(String name) {
        this.name = name;
    }
}