package com.cesgroup.agr.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "complaint_praise")
public class ComplaintPraise extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 产品编码
     */
    private String code;

    /**
     * 日期
     */
    @Column(name = "cp_time")
    private Date cpTime;

    /**
     * 得分
     */
    private BigDecimal score;

    /**
     * 市场摊位
     */
    @Column(name = "market_booth")
    private String marketBooth;

    /**
     * 市场代码
     */
    @Column(name = "market_code")
    private String marketCode;

    /**
     * 客户类型：1肉类客户；2蔬菜客户
     */
    @Column(name = "customer_type")
    private Byte customerType;

    @Column(name = "customer_code")
    private String customerCode;

    /**
     * 客户名称
     */
    @Column(name = "customer_name")
    private String customerName;

    /**
     * 类型：1投诉；2表扬
     */
    private Byte type;

    /**
     * 表扬/投诉内容
     */
    private String comment;

    /**
     * 处理结果
     */
    private String result;

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
     * 获取产品编码
     *
     * @return code - 产品编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置产品编码
     *
     * @param code 产品编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取日期
     *
     * @return cp_time - 日期
     */
    public Date getCpTime() {
        return cpTime;
    }

    /**
     * 设置日期
     *
     * @param cpTime 日期
     */
    public void setCpTime(Date cpTime) {
        this.cpTime = cpTime;
    }

    /**
     * 获取得分
     *
     * @return score - 得分
     */
    public BigDecimal getScore() {
        return score;
    }

    /**
     * 设置得分
     *
     * @param score 得分
     */
    public void setScore(BigDecimal score) {
        this.score = score;
    }

    /**
     * 获取市场摊位
     *
     * @return market_booth - 市场摊位
     */
    public String getMarketBooth() {
        return marketBooth;
    }

    /**
     * 设置市场摊位
     *
     * @param marketBooth 市场摊位
     */
    public void setMarketBooth(String marketBooth) {
        this.marketBooth = marketBooth;
    }

    /**
     * 获取市场代码
     *
     * @return market_code - 市场代码
     */
    public String getMarketCode() {
        return marketCode;
    }

    /**
     * 设置市场代码
     *
     * @param marketCode 市场代码
     */
    public void setMarketCode(String marketCode) {
        this.marketCode = marketCode;
    }

    /**
     * 获取客户类型：1肉类客户；2蔬菜客户
     *
     * @return customer_type - 客户类型：1肉类客户；2蔬菜客户
     */
    public Byte getCustomerType() {
        return customerType;
    }

    /**
     * 设置客户类型：1肉类客户；2蔬菜客户
     *
     * @param customerType 客户类型：1肉类客户；2蔬菜客户
     */
    public void setCustomerType(Byte customerType) {
        this.customerType = customerType;
    }

    /**
     * @return customer_code
     */
    public String getCustomerCode() {
        return customerCode;
    }

    /**
     * @param customerCode
     */
    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    /**
     * 获取客户名称
     *
     * @return customer_name - 客户名称
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * 设置客户名称
     *
     * @param customerName 客户名称
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * 获取类型：1投诉；2表扬
     *
     * @return type - 类型：1投诉；2表扬
     */
    public Byte getType() {
        return type;
    }

    /**
     * 设置类型：1投诉；2表扬
     *
     * @param type 类型：1投诉；2表扬
     */
    public void setType(Byte type) {
        this.type = type;
    }

    /**
     * 获取表扬/投诉内容
     *
     * @return comment - 表扬/投诉内容
     */
    public String getComment() {
        return comment;
    }

    /**
     * 设置表扬/投诉内容
     *
     * @param comment 表扬/投诉内容
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * 获取处理结果
     *
     * @return result - 处理结果
     */
    public String getResult() {
        return result;
    }

    /**
     * 设置处理结果
     *
     * @param result 处理结果
     */
    public void setResult(String result) {
        this.result = result;
    }
}