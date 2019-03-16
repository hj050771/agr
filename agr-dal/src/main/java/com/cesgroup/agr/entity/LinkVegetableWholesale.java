package com.cesgroup.agr.entity;

import javax.persistence.*;

@Table(name = "link_vegetable_wholesale")
public class LinkVegetableWholesale extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 供应商表关联id
     */
    @Column(name = "slaughterhouse_id")
    private String slaughterhouseId;

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
     * 获取供应商表关联id
     *
     * @return slaughterhouse_id - 供应商表关联id
     */
    public String getSlaughterhouseId() {
        return slaughterhouseId;
    }

    /**
     * 设置供应商表关联id
     *
     * @param slaughterhouseId 供应商表关联id
     */
    public void setSlaughterhouseId(String slaughterhouseId) {
        this.slaughterhouseId = slaughterhouseId;
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