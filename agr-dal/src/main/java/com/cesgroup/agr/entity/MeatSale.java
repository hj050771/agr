package com.cesgroup.agr.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "meat_sale")
public class MeatSale extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 摊位号
     */
    @Column(name = "seller_no")
    private String sellerNo;

    /**
     * 确认单号
     */
    private String number;

    /**
     * 商品id
     */
    @Column(name = "product_id")
    private String productId;

    /**
     * 品牌id
     */
    @Column(name = "brand_id")
    private String brandId;

    /**
     * 市场价
     */
    @Column(name = "market_price")
    private BigDecimal marketPrice;

    /**
     * 促销价
     */
    @Column(name = "promotion_price")
    private BigDecimal promotionPrice;

    /**
     * 促销天数
     */
    @Column(name = "promotion_days")
    private Integer promotionDays;

    /**
     * 实际销售价格
     */
    @Column(name = "sale_price")
    private BigDecimal salePrice;

    /**
     * 销售时间
     */
    @Column(name = "sale_date")
    private Date saleDate;

    /**
     * 重量
     */
    private BigDecimal weight;

    /**
     * 合计金额
     */
    @Column(name = "sum_money")
    private BigDecimal sumMoney;

    /**
     * 备注
     */
    private String comment;

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
     * 获取摊位号
     *
     * @return seller_no - 摊位号
     */
    public String getSellerNo() {
        return sellerNo;
    }

    /**
     * 设置摊位号
     *
     * @param sellerNo 摊位号
     */
    public void setSellerNo(String sellerNo) {
        this.sellerNo = sellerNo;
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
     * 获取品牌id
     *
     * @return brand_id - 品牌id
     */
    public String getBrandId() {
        return brandId;
    }

    /**
     * 设置品牌id
     *
     * @param brandId 品牌id
     */
    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    /**
     * 获取市场价
     *
     * @return market_price - 市场价
     */
    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    /**
     * 设置市场价
     *
     * @param marketPrice 市场价
     */
    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    /**
     * 获取促销价
     *
     * @return promotion_price - 促销价
     */
    public BigDecimal getPromotionPrice() {
        return promotionPrice;
    }

    /**
     * 设置促销价
     *
     * @param promotionPrice 促销价
     */
    public void setPromotionPrice(BigDecimal promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    /**
     * 获取促销天数
     *
     * @return promotion_days - 促销天数
     */
    public Integer getPromotionDays() {
        return promotionDays;
    }

    /**
     * 设置促销天数
     *
     * @param promotionDays 促销天数
     */
    public void setPromotionDays(Integer promotionDays) {
        this.promotionDays = promotionDays;
    }

    /**
     * 获取实际销售价格
     *
     * @return sale_price - 实际销售价格
     */
    public BigDecimal getSalePrice() {
        return salePrice;
    }

    /**
     * 设置实际销售价格
     *
     * @param salePrice 实际销售价格
     */
    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    /**
     * 获取销售时间
     *
     * @return sale_date - 销售时间
     */
    public Date getSaleDate() {
        return saleDate;
    }

    /**
     * 设置销售时间
     *
     * @param saleDate 销售时间
     */
    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
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
     * 获取合计金额
     *
     * @return sum_money - 合计金额
     */
    public BigDecimal getSumMoney() {
        return sumMoney;
    }

    /**
     * 设置合计金额
     *
     * @param sumMoney 合计金额
     */
    public void setSumMoney(BigDecimal sumMoney) {
        this.sumMoney = sumMoney;
    }

    /**
     * 获取备注
     *
     * @return comment - 备注
     */
    public String getComment() {
        return comment;
    }

    /**
     * 设置备注
     *
     * @param comment 备注
     */
    public void setComment(String comment) {
        this.comment = comment;
    }
}