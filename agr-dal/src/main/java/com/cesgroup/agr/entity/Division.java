package com.cesgroup.agr.entity;

import javax.persistence.*;

public class Division extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 产地行政区划编码
     */
    private String code;

    /**
     * 产地行政区划名称
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
     * 获取产地行政区划编码
     *
     * @return code - 产地行政区划编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置产地行政区划编码
     *
     * @param code 产地行政区划编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取产地行政区划名称
     *
     * @return name - 产地行政区划名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置产地行政区划名称
     *
     * @param name 产地行政区划名称
     */
    public void setName(String name) {
        this.name = name;
    }
}