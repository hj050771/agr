package com.cesgroup.agr.entity;

import javax.persistence.*;

public class Product extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 品名代码
     */
    private String code;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品类型：1：蔬菜2：肉类
     */
    private Byte type;

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
     * 获取品名代码
     *
     * @return code - 品名代码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置品名代码
     *
     * @param code 品名代码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取商品名称
     *
     * @return name - 商品名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置商品名称
     *
     * @param name 商品名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取商品类型：1：蔬菜2：肉类
     *
     * @return type - 商品类型：1：蔬菜2：肉类
     */
    public Byte getType() {
        return type;
    }

    /**
     * 设置商品类型：1：蔬菜2：肉类
     *
     * @param type 商品类型：1：蔬菜2：肉类
     */
    public void setType(Byte type) {
        this.type = type;
    }
}