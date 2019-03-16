package com.cesgroup.agr.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "vegetable_approach")
public class VegetableApproach extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 确认单号
     */
    private String number;

    /**
     * 屠宰场关联id
     */
    @Column(name = "link_slaughterhouse_id")
    private String linkSlaughterhouseId;

    /**
     * 供应商关联id(即客户表id)
     */
    @Column(name = "link_supplier_id")
    private String linkSupplierId;

    /**
     * 品牌关联id
     */
    @Column(name = "link_brand_id")
    private String linkBrandId;

    /**
     * 商品关联id
     */
    @Column(name = "link_product_id")
    private String linkProductId;

    /**
     * 产地id
     */
    @Column(name = "division_id")
    private String divisionId;

    /**
     * 进场日期
     */
    @Column(name = "approach_date")
    private Date approachDate;

    /**
     * 数量
     */
    private BigDecimal amount;

    /**
     * 重量
     */
    private BigDecimal weight;

    /**
     * 金额
     */
    @Column(name = "sum_money")
    private BigDecimal sumMoney;

    /**
     * 单价
     */
    private BigDecimal price;

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
     * 获取确认单号
     *
     * @return number - 确认单号
     */
    public String getNumber() {
        return number;
    }

    /**
     * 设置确认单号
     *
     * @param number 确认单号
     */
    public void setNumber(String number) {
        this.number = number;
    }

    /**
     * 获取屠宰场关联id
     *
     * @return link_slaughterhouse_id - 屠宰场关联id
     */
    public String getLinkSlaughterhouseId() {
        return linkSlaughterhouseId;
    }

    /**
     * 设置屠宰场关联id
     *
     * @param linkSlaughterhouseId 屠宰场关联id
     */
    public void setLinkSlaughterhouseId(String linkSlaughterhouseId) {
        this.linkSlaughterhouseId = linkSlaughterhouseId;
    }

    /**
     * 获取供应商关联id(即客户表id)
     *
     * @return link_supplier_id - 供应商关联id(即客户表id)
     */
    public String getLinkSupplierId() {
        return linkSupplierId;
    }

    /**
     * 设置供应商关联id(即客户表id)
     *
     * @param linkSupplierId 供应商关联id(即客户表id)
     */
    public void setLinkSupplierId(String linkSupplierId) {
        this.linkSupplierId = linkSupplierId;
    }

    /**
     * 获取品牌关联id
     *
     * @return link_brand_id - 品牌关联id
     */
    public String getLinkBrandId() {
        return linkBrandId;
    }

    /**
     * 设置品牌关联id
     *
     * @param linkBrandId 品牌关联id
     */
    public void setLinkBrandId(String linkBrandId) {
        this.linkBrandId = linkBrandId;
    }

    /**
     * 获取商品关联id
     *
     * @return link_product_id - 商品关联id
     */
    public String getLinkProductId() {
        return linkProductId;
    }

    /**
     * 设置商品关联id
     *
     * @param linkProductId 商品关联id
     */
    public void setLinkProductId(String linkProductId) {
        this.linkProductId = linkProductId;
    }

    /**
     * 获取产地id
     *
     * @return division_id - 产地id
     */
    public String getDivisionId() {
        return divisionId;
    }

    /**
     * 设置产地id
     *
     * @param divisionId 产地id
     */
    public void setDivisionId(String divisionId) {
        this.divisionId = divisionId;
    }

    /**
     * 获取进场日期
     *
     * @return approach_date - 进场日期
     */
    public Date getApproachDate() {
        return approachDate;
    }

    /**
     * 设置进场日期
     *
     * @param approachDate 进场日期
     */
    public void setApproachDate(Date approachDate) {
        this.approachDate = approachDate;
    }

    /**
     * 获取数量
     *
     * @return amount - 数量
     */
    public BigDecimal getAmount() {
        return amount;
    }

    /**
     * 设置数量
     *
     * @param amount 数量
     */
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    /**
     * 获取重量
     *
     * @return weight - 重量
     */
    public BigDecimal getWeight() {
        return weight;
    }

    /**
     * 设置重量
     *
     * @param weight 重量
     */
    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    /**
     * 获取金额
     *
     * @return sum_money - 金额
     */
    public BigDecimal getSumMoney() {
        return sumMoney;
    }

    /**
     * 设置金额
     *
     * @param sumMoney 金额
     */
    public void setSumMoney(BigDecimal sumMoney) {
        this.sumMoney = sumMoney;
    }

    /**
     * 获取单价
     *
     * @return price - 单价
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * 设置单价
     *
     * @param price 单价
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}