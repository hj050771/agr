package com.cesgroup.agr.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

public class Quotation extends BaseEntity {
    /**
     * 市场id
     */
    @Column(name = "ep_id")
    private String epId;

    /**
     * 商品id
     */
    @Column(name = "product_id")
    private String productId;

    /**
     * 规格
     */
    private String specification;

    /**
     * 单位
     */
    private String unit;

    /**
     * 日期
     */
    @Column(name = "sale_date")
    private Date saleDate;

    /**
     * 销量
     */
    @Column(name = "sale_volume")
    private BigDecimal saleVolume;

    /**
     * 销价
     */
    @Column(name = "sale_price")
    private BigDecimal salePrice;

    /**
     * 销售指导价（上限）
     */
    @Column(name = "guide_price_upper")
    private BigDecimal guidePriceUpper;

    /**
     * 销售指导价（下限）
     */
    @Column(name = "guide_price_lower")
    private BigDecimal guidePriceLower;

    /**
     * 获取市场id
     *
     * @return ep_id - 市场id
     */
    public String getEpId() {
        return epId;
    }

    /**
     * 设置市场id
     *
     * @param epId 市场id
     */
    public void setEpId(String epId) {
        this.epId = epId;
    }

    /**
     * 获取商品id
     *
     * @return product_id - 商品id
     */
    public String getProductId() {
        return productId;
    }

    /**
     * 设置商品id
     *
     * @param productId 商品id
     */
    public void setProductId(String productId) {
        this.productId = productId;
    }

    /**
     * 获取规格
     *
     * @return specification - 规格
     */
    public String getSpecification() {
        return specification;
    }

    /**
     * 设置规格
     *
     * @param specification 规格
     */
    public void setSpecification(String specification) {
        this.specification = specification;
    }

    /**
     * 获取单位
     *
     * @return unit - 单位
     */
    public String getUnit() {
        return unit;
    }

    /**
     * 设置单位
     *
     * @param unit 单位
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * 获取日期
     *
     * @return sale_date - 日期
     */
    public Date getSaleDate() {
        return saleDate;
    }

    /**
     * 设置日期
     *
     * @param saleDate 日期
     */
    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    /**
     * 获取销量
     *
     * @return sale_volume - 销量
     */
    public BigDecimal getSaleVolume() {
        return saleVolume;
    }

    /**
     * 设置销量
     *
     * @param saleVolume 销量
     */
    public void setSaleVolume(BigDecimal saleVolume) {
        this.saleVolume = saleVolume;
    }

    /**
     * 获取销价
     *
     * @return sale_price - 销价
     */
    public BigDecimal getSalePrice() {
        return salePrice;
    }

    /**
     * 设置销价
     *
     * @param salePrice 销价
     */
    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    /**
     * 获取销售指导价（上限）
     *
     * @return guide_price_upper - 销售指导价（上限）
     */
    public BigDecimal getGuidePriceUpper() {
        return guidePriceUpper;
    }

    /**
     * 设置销售指导价（上限）
     *
     * @param guidePriceUpper 销售指导价（上限）
     */
    public void setGuidePriceUpper(BigDecimal guidePriceUpper) {
        this.guidePriceUpper = guidePriceUpper;
    }

    /**
     * 获取销售指导价（下限）
     *
     * @return guide_price_lower - 销售指导价（下限）
     */
    public BigDecimal getGuidePriceLower() {
        return guidePriceLower;
    }

    /**
     * 设置销售指导价（下限）
     *
     * @param guidePriceLower 销售指导价（下限）
     */
    public void setGuidePriceLower(BigDecimal guidePriceLower) {
        this.guidePriceLower = guidePriceLower;
    }
}