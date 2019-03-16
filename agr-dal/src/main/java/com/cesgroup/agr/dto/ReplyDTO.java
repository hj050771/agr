package com.cesgroup.agr.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: YYB
 * @description:
 * @date: 2018/10/16.
 * @modified by:
 */
public class ReplyDTO implements Serializable {
    private String rId;
    private String tzEpId;
    private String tzEpName;
    private Integer rState;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date rCreatedAt;
    private BigDecimal price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date purchaseAt;
    private String remark;
    private String bId;
    private String epYzId;
    private String epYzName;
    private String vName;
    private Integer amount;
    private BigDecimal weight;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date bCreatedAt;

    public String getrId() {
        return rId;
    }

    public void setrId(String rId) {
        this.rId = rId;
    }

    public String getTzEpId() {
        return tzEpId;
    }

    public void setTzEpId(String tzEpId) {
        this.tzEpId = tzEpId;
    }

    public String getTzEpName() {
        return tzEpName;
    }

    public void setTzEpName(String tzEpName) {
        this.tzEpName = tzEpName;
    }

    public Integer getrState() {
        return rState;
    }

    public void setrState(Integer rState) {
        this.rState = rState;
    }

    public Date getrCreatedAt() {
        return rCreatedAt;
    }

    public void setrCreatedAt(Date rCreatedAt) {
        this.rCreatedAt = rCreatedAt;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getPurchaseAt() {
        return purchaseAt;
    }

    public void setPurchaseAt(Date purchaseAt) {
        this.purchaseAt = purchaseAt;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId;
    }

    public String getEpYzId() {
        return epYzId;
    }

    public void setEpYzId(String epYzId) {
        this.epYzId = epYzId;
    }

    public String getEpYzName() {
        return epYzName;
    }

    public void setEpYzName(String epYzName) {
        this.epYzName = epYzName;
    }

    public String getvName() {
        return vName;
    }

    public void setvName(String vName) {
        this.vName = vName;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public Date getbCreatedAt() {
        return bCreatedAt;
    }

    public void setbCreatedAt(Date bCreatedAt) {
        this.bCreatedAt = bCreatedAt;
    }
}
