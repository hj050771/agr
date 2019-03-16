package com.cesgroup.agr.entity;

import javax.persistence.*;

@Table(name = "link_meat_product")
public class LinkMeatProduct extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 产品关联id
     */
    @Column(name = "product_id")
    private String productId;

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
     * 获取产品关联id
     *
     * @return product_id - 产品关联id
     */
    public String getProductId() {
        return productId;
    }

    /**
     * 设置产品关联id
     *
     * @param productId 产品关联id
     */
    public void setProductId(String productId) {
        this.productId = productId;
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