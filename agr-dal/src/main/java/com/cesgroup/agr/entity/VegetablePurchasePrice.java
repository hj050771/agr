package com.cesgroup.agr.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "vegetable_purchase_price")
public class VegetablePurchasePrice extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 产品id
     */
    @Column(name = "product_id")
    private String productId;

    /**
     * 进价
     */
    @Column(name = "purchase_price")
    private BigDecimal purchasePrice;

    @Column(name = "purchase_date")
    private Date purchaseDate;

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
     * 获取产品id
     *
     * @return product_id - 产品id
     */
    public String getProductId() {
        return productId;
    }

    /**
     * 设置产品id
     *
     * @param productId 产品id
     */
    public void setProductId(String productId) {
        this.productId = productId;
    }

    /**
     * 获取进价
     *
     * @return purchase_price - 进价
     */
    public BigDecimal getPurchasePrice() {
        return purchasePrice;
    }

    /**
     * 设置进价
     *
     * @param purchasePrice 进价
     */
    public void setPurchasePrice(BigDecimal purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    /**
     * @return purchase_date
     */
    public Date getPurchaseDate() {
        return purchaseDate;
    }

    /**
     * @param purchaseDate
     */
    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
}