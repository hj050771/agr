package com.cesgroup.agr.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import javax.persistence.*;

@Table(name = "t_secret_key")
public class SecretKey extends BaseEntity {
    /**
     * 组织id
     */
    @Column(name = "ep_id")
    private String epId;

    /**
     * 公钥
     */
    @Column(name = "pub_key")
    private String pubKey;

    /**
     * 私钥
     */
    @Column(name = "pri_key")
    private String priKey;

    /**
     * 有效期
     */
    @Column(name = "validate_at")
    @DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss" )
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date validateAt;

    /**
     * 获取组织id
     *
     * @return ep_id - 组织id
     */
    public String getEpId() {
        return epId;
    }

    /**
     * 设置组织id
     *
     * @param epId 组织id
     */
    public void setEpId(String epId) {
        this.epId = epId;
    }

    /**
     * 获取公钥
     *
     * @return pub_key - 公钥
     */
    public String getPubKey() {
        return pubKey;
    }

    /**
     * 设置公钥
     *
     * @param pubKey 公钥
     */
    public void setPubKey(String pubKey) {
        this.pubKey = pubKey;
    }

    /**
     * 获取私钥
     *
     * @return pri_key - 私钥
     */
    public String getPriKey() {
        return priKey;
    }

    /**
     * 设置私钥
     *
     * @param priKey 私钥
     */
    public void setPriKey(String priKey) {
        this.priKey = priKey;
    }

    /**
     * 获取有效期
     *
     * @return validate_at - 有效期
     */
    public Date getValidateAt() {
        return validateAt;
    }

    /**
     * 设置有效期
     *
     * @param validateAt 有效期
     */
    public void setValidateAt(Date validateAt) {
        this.validateAt = validateAt;
    }
}