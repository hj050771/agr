package com.cesgroup.agr.entity;

import javax.persistence.*;

@Table(name = "link_meat_supplier")
public class LinkMeatSupplier extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 供应商(即客户表id)
     */
    @Column(name = "supplier_id")
    private String supplierId;

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
     * 获取供应商(即客户表id)
     *
     * @return supplier_id - 供应商(即客户表id)
     */
    public String getSupplierId() {
        return supplierId;
    }

    /**
     * 设置供应商(即客户表id)
     *
     * @param supplierId 供应商(即客户表id)
     */
    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
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