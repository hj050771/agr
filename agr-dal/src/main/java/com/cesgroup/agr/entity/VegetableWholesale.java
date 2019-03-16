package com.cesgroup.agr.entity;

import javax.persistence.*;

@Table(name = "vegetable_wholesale")
public class VegetableWholesale extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 供货商编码
     */
    private String code;

    /**
     * 批发市场名称
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
     * 获取供货商编码
     *
     * @return code - 供货商编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置供货商编码
     *
     * @param code 供货商编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取批发市场名称
     *
     * @return name - 批发市场名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置批发市场名称
     *
     * @param name 批发市场名称
     */
    public void setName(String name) {
        this.name = name;
    }
}