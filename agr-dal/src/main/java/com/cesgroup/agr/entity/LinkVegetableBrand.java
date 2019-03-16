package com.cesgroup.agr.entity;

import javax.persistence.*;

@Table(name = "link_vegetable_brand")
public class LinkVegetableBrand extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 品牌表关联id
     */
    @Column(name = "brand_id")
    private String brandId;

    /**
     * 产地行政区划名称
     */
    @Column(name = "approach_id")
    private String approachId;

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
     * 获取品牌表关联id
     *
     * @return brand_id - 品牌表关联id
     */
    public String getBrandId() {
        return brandId;
    }

    /**
     * 设置品牌表关联id
     *
     * @param brandId 品牌表关联id
     */
    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    /**
     * 获取产地行政区划名称
     *
     * @return approach_id - 产地行政区划名称
     */
    public String getApproachId() {
        return approachId;
    }

    /**
     * 设置产地行政区划名称
     *
     * @param approachId 产地行政区划名称
     */
    public void setApproachId(String approachId) {
        this.approachId = approachId;
    }
}