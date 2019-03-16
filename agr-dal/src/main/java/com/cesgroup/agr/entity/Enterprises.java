package com.cesgroup.agr.entity;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

public class Enterprises extends BaseEntity {
    /**
     * 组织id
     */
    @Column(name = "org_id")
    private String orgId;

    /**
     * 组织类别
     */
    @Column(name = "org_class")
    private String orgClass;

    /**
     * 企业名称
     */
    @Column(name = "ep_name")
    private String epName;

    private String address;

    private String principal;

    private String telephone;

    /**
     * 行业id
     */
    @Column(name = "c_id")
    private String cId;

    @Transient
    private String cCode;

    /**
     * 行业细化分类id
     */
    @Column(name = "mc_id")
    private String mcId;

    /**
     * 合格证
     */
    private String certificate;

    /**
     * 养殖代码
     */
    @Column(name = "breeding_code")
    private String breedingCode;

    /**
     * 粪污处理方式
     */
    @Column(name = "dict_data_fwcl")
    private String dictDataFwcl;

    /**
     * 三品一标
     */
    @Column(name = "dict_data_spyb")
    private String dictDataSpyb;

    /**
     * 标准化养殖场
     */
    @Column(name = "dict_data_bzhyzc")
    private String dictDataBzhyzc;

    /**
     * 屠宰类型
     */
    @Column(name = "dict_data_tzlx")
    private String dictDataTzlx;

    /**
     * 市编码
     */
    @Column(name = "city_code")
    private String cityCode;

    @Column(name = "city")
    private String city;

    /**
     * 区/县编码
     */
    @Column(name = "county_code")
    private String countyCode;

    @Column(name = "county")
    private String county;

    /**
     * 乡/镇编码
     */
    @Column(name = "town_code")
    private String townCode;

    /**经度*/
    private BigDecimal lng;

    /**纬度*/
    private BigDecimal lat;

    /**
     * 年产值
     */
    @Column(name = "year_output_value")
    private String yearOutputValue;
    
    /**
     * 设计模式
     */
    @Column(name = "design_pattern")
    private String designPattern;

    /**
     * 风险分级ID
     */
    @Column(name = "rc_id")
    private String rcId;
    
    @Transient
    private String mcName;

    @Transient
    private String cName;

    /**
     *  邮编
     */
    @Column(name = "postcode")
    private String postcode;

    /**
     * 成立日期
     */
    @Column(name = "reg_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date regDate;

    /**
     * 传真
     */
    @Column(name = "fax")
    private String fax;

    /**
     * 隶属关系字典维护
     */
    @Column(name = "membership")
    private String membership;

    /**
     * 级别 字典维护
     */
    @Column(name = "level")
    private String level;

    /**
     * 法律地位 字典维护
     */
    @Column(name = "legal_status")
    private String legalStatus;

    /**
     * 资质 字典维护
     */
    @Column(name = "qualification")
    private String qualification;

    /**
     * 站号
     */
    @Column(name = "station_no")
    private String stationNo;

    /**
     * 财政情况
     */
    @Column(name = "financial")
    private String financial;

    /**
     * 在编人员数
     */
    @Column(name = "perm_staff_num")
    private Long permStaffNum;

    /**
     * 聘任人员数
     */
    @Column(name = "appo_staff_num")
    private Long appoStaffNum;

    @Column(name = "dependency_id")
    private String dependencyId;

    public String getMcName() {
		return mcName;
	}

	public void setMcName(String mcName) {
		this.mcName = mcName;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	/**
     * 获取组织id
     *
     * @return org_id - 组织id
     */
    public String getOrgId() {
        return orgId;
    }

    /**
     * 设置组织id
     *
     * @param orgId 组织id
     */
    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getEpName() {
        return epName;
    }

    public void setEpName(String epName) {
        this.epName = epName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取行业id
     *
     * @return c_id - 行业id
     */
    public String getcId() {
        return cId;
    }

    /**
     * 设置行业id
     *
     * @param cId 行业id
     */
    public void setcId(String cId) {
        this.cId = cId;
    }

    /**
     * 获取行业细化分类id
     *
     * @return mc_id - 行业细化分类id
     */
    public String getMcId() {
        return mcId;
    }

    /**
     * 设置行业细化分类id
     *
     * @param mcId 行业细化分类id
     */
    public void setMcId(String mcId) {
        this.mcId = mcId;
    }

    /**
     * 获取合格证
     *
     * @return certificate - 合格证
     */
    public String getCertificate() {
        return certificate;
    }

    /**
     * 设置合格证
     *
     * @param certificate 合格证
     */
    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    /**
     * 获取养殖代码
     *
     * @return breeding_code - 养殖代码
     */
    public String getBreedingCode() {
        return breedingCode;
    }

    /**
     * 设置养殖代码
     *
     * @param breedingCode 养殖代码
     */
    public void setBreedingCode(String breedingCode) {
        this.breedingCode = breedingCode;
    }

    /**
     * 获取粪污处理方式
     *
     * @return dict_data_fwcl - 粪污处理方式
     */
    public String getDictDataFwcl() {
        return dictDataFwcl;
    }

    /**
     * 设置粪污处理方式
     *
     * @param dictDataFwcl 粪污处理方式
     */
    public void setDictDataFwcl(String dictDataFwcl) {
        this.dictDataFwcl = dictDataFwcl;
    }

    /**
     * 获取三品一标
     *
     * @return dict_data_spyb - 三品一标
     */
    public String getDictDataSpyb() {
        return dictDataSpyb;
    }

    /**
     * 设置三品一标
     *
     * @param dictDataSpyb 三品一标
     */
    public void setDictDataSpyb(String dictDataSpyb) {
        this.dictDataSpyb = dictDataSpyb;
    }

    /**
     * 获取标准化养殖场
     *
     * @return dict_data_bzhyzc - 标准化养殖场
     */
    public String getDictDataBzhyzc() {
        return dictDataBzhyzc;
    }

    /**
     * 设置标准化养殖场
     *
     * @param dictDataBzhyzc 标准化养殖场
     */
    public void setDictDataBzhyzc(String dictDataBzhyzc) {
        this.dictDataBzhyzc = dictDataBzhyzc;
    }

    /**
     * 获取屠宰类型
     *
     * @return dict_data_tzlx - 屠宰类型
     */
    public String getDictDataTzlx() {
        return dictDataTzlx;
    }

    /**
     * 设置屠宰类型
     *
     * @param dictDataTzlx 屠宰类型
     */
    public void setDictDataTzlx(String dictDataTzlx) {
        this.dictDataTzlx = dictDataTzlx;
    }

    /**
     * 获取市编码
     *
     * @return city_code - 市编码
     */
    public String getCityCode() {
        return cityCode;
    }

    /**
     * 设置市编码
     *
     * @param cityCode 市编码
     */
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getCountyCode() {
        return countyCode;
    }

    public void setCountyCode(String countyCode) {
        this.countyCode = countyCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    /**
     * 获取乡/镇编码
     *
     * @return town_code - 乡/镇编码
     */
    public String getTownCode() {
        return townCode;
    }

    /**
     * 设置乡/镇编码
     *
     * @param townCode 乡/镇编码
     */
    public void setTownCode(String townCode) {
        this.townCode = townCode;
    }

    public BigDecimal getLng() {
        return lng;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }

    public BigDecimal getLat() {
        return lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public String getYearOutputValue() {
		return yearOutputValue;
	}

	public void setYearOutputValue(String yearOutputValue) {
		this.yearOutputValue = yearOutputValue;
	}

	public String getDesignPattern() {
		return designPattern;
	}

	public void setDesignPattern(String designPattern) {
		this.designPattern = designPattern;
	}

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String cCode) {
        this.cCode = cCode;
    }

    /**
     * 获取风险分级ID
     *
     * @return rc_id - 风险分级ID
     */
    public String getRcId() {
        return rcId;
    }

    /**
     * 设置风险分级ID
     *
     * @param rcId 风险分级ID
     */
    public void setRcId(String rcId) {
        this.rcId = rcId;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getMembership() {
        return membership;
    }

    public void setMembership(String membership) {
        this.membership = membership;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getLegalStatus() {
        return legalStatus;
    }

    public void setLegalStatus(String legalStatus) {
        this.legalStatus = legalStatus;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getStationNo() {
		return stationNo;
	}

	public void setStationNo(String stationNo) {
		this.stationNo = stationNo;
	}

	public String getFinancial() {
        return financial;
    }

    public void setFinancial(String financial) {
        this.financial = financial;
    }

    public Long getPermStaffNum() {
        return permStaffNum;
    }

    public void setPermStaffNum(Long permStaffNum) {
        this.permStaffNum = permStaffNum;
    }

    public Long getAppoStaffNum() {
        return appoStaffNum;
    }

    public void setAppoStaffNum(Long appoStaffNum) {
        this.appoStaffNum = appoStaffNum;
    }

    public String getOrgClass() {
        return orgClass;
    }

    public void setOrgClass(String orgClass) {
        this.orgClass = orgClass;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getDependencyId() {
        return dependencyId;
    }

    public void setDependencyId(String dependencyId) {
        this.dependencyId = dependencyId;
    }
}