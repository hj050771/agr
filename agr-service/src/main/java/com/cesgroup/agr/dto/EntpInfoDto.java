package com.cesgroup.agr.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @description: 企业信息(包含系统管理平台中的信息)
 */
public class EntpInfoDto implements Serializable {

    //组织分类代码:企业
    public final static String CODE_ENPT="enterprise";

    //组织分类代码:政府
    public final static String CODE_GOV="government";

    private String id;
    /**
     * 组织id
     */
    private String orgId;

    /**
     *  组织类别代码 政府：government 企业：enterprise
     */
    private String orgClassCode;

    /**
     *  组织类别 政府：1 企业：2
     */
    private String orgClass;
    /**
     * 企业名称
     */
    private String epName;
    /**
     * 行业id
     */
    private String cId;

    private String cName;

    private String cCode;
    /**
     * 行业细化分类id
     */
    private String mcId;

    private String mcName;

    private String rcId;
    /**
     * 合格证
     */
    private String certificate;

    /**
     * 养殖代码
     */
    private String breedingCode;

    /**
     * 粪污处理方式
     */
    private String dictDataFwcl;

    /**
     * 三品一标
     */
    private String dictDataSpyb;

    /**
     * 标准化养殖场
     */
    private String dictDataBzhyzc;

    /**
     * 屠宰类型
     */
    private String dictDataTzlx;

    /**
     * 市编码
     */
    private String cityCode;

    private String city;

    /**
     * 区/县编码
     */
    private String countyCode;

    private String county;

    /**
     * 乡/镇编码
     */
    private String townCode;

    /**
     * 年产值
     */
    private String yearOutputValue;

    /**
     * 设计模式
     */
    private String designPattern;
    private Integer status;
    private String createUser;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createdAt;
    private String updateUser;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date updatedAt;
    private String tenantId;


    /**
     * 统一社会信用代码
     */
    private String applNo;

    private String address;
    /**
     * 经度
     */
    private BigDecimal lng;

    /**
     * 纬度
     */
    private BigDecimal lat;
    /**
     * 企业负责人电话
     */
    private String telephone;
    /**
     * 企业负责人姓名
     */
    private String principal;
    private String email;
    /**
     * 注册资金
     */
    private String regMoney;
    /**
     * 官网
     */
    private String website;
    private String imageUrl;
    /**
     * 企业负责人身份证号
     */
    private String principalIdNum;
    /**
     * 质量负责人姓名
     */
    private String qaLeader;
    /**
     * 质量负责人身份证
     */
    private String qaLeaderIdNum;
    /**
     * 质量负责人电话
     */
    private String qaLeaderPhone;
    /**
     * 行政区划id
     */
    private String divisionId;
    /**
     *  邮编
     */
    private String postcode;

    /**
     * 成立日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date regDate;

    /**
     * 传真
     */
    private String fax;

    /**
     * 隶属关系字典维护
     */
    private String membership;

    /**
     * 级别 字典维护
     */
    private String level;

    /**
     * 法律地位 字典维护
     */
    private String legalStatus;

    /**
     * 资质 字典维护
     */
    private String qualification;

    /**
     * 站号
     */
    private String stationNo;

    /**
     * 财政情况
     */
    private String financial;

    /**
     * 在编人员数
     */
    private Long permStaffNum;

    /**
     * 聘任人员数
     */
    private Long appoStaffNum;

    /**
     * 依赖组织id
     */
    private String dependencyId;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrgClassCode() {
        return orgClassCode;
    }

    public void setOrgClassCode(String orgClassCode) {
        this.orgClassCode = orgClassCode;
    }

    public String getOrgClass() {
        return orgClass;
    }

    public void setOrgClass(String orgClass) {
        this.orgClass = orgClass;
    }

    public String getApplNo() {
        return applNo;
    }

    public void setApplNo(String applNo) {
        this.applNo = applNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegMoney() {
        return regMoney;
    }

    public void setRegMoney(String regMoney) {
        this.regMoney = regMoney;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getPrincipalIdNum() {
        return principalIdNum;
    }

    public void setPrincipalIdNum(String principalIdNum) {
        this.principalIdNum = principalIdNum;
    }

    public String getQaLeader() {
        return qaLeader;
    }

    public void setQaLeader(String qaLeader) {
        this.qaLeader = qaLeader;
    }

    public String getQaLeaderIdNum() {
        return qaLeaderIdNum;
    }

    public void setQaLeaderIdNum(String qaLeaderIdNum) {
        this.qaLeaderIdNum = qaLeaderIdNum;
    }

    public String getQaLeaderPhone() {
        return qaLeaderPhone;
    }

    public void setQaLeaderPhone(String qaLeaderPhone) {
        this.qaLeaderPhone = qaLeaderPhone;
    }

    public String getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(String divisionId) {
        this.divisionId = divisionId;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getEpName() {
        return epName;
    }

    public void setEpName(String epName) {
        this.epName = epName;
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getMcId() {
        return mcId;
    }

    public void setMcId(String mcId) {
        this.mcId = mcId;
    }

    public String getMcName() {
        return mcName;
    }

    public void setMcName(String mcName) {
        this.mcName = mcName;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getBreedingCode() {
        return breedingCode;
    }

    public void setBreedingCode(String breedingCode) {
        this.breedingCode = breedingCode;
    }

    public String getDictDataFwcl() {
        return dictDataFwcl;
    }

    public void setDictDataFwcl(String dictDataFwcl) {
        this.dictDataFwcl = dictDataFwcl;
    }

    public String getDictDataSpyb() {
        return dictDataSpyb;
    }

    public void setDictDataSpyb(String dictDataSpyb) {
        this.dictDataSpyb = dictDataSpyb;
    }

    public String getDictDataBzhyzc() {
        return dictDataBzhyzc;
    }

    public void setDictDataBzhyzc(String dictDataBzhyzc) {
        this.dictDataBzhyzc = dictDataBzhyzc;
    }

    public String getDictDataTzlx() {
        return dictDataTzlx;
    }

    public void setDictDataTzlx(String dictDataTzlx) {
        this.dictDataTzlx = dictDataTzlx;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getCountyCode() {
        return countyCode;
    }

    public void setCountyCode(String countyCode) {
        this.countyCode = countyCode;
    }

    public String getTownCode() {
        return townCode;
    }

    public void setTownCode(String townCode) {
        this.townCode = townCode;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String cCode) {
        this.cCode = cCode;
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

	public String getRcId() {
		return rcId;
	}

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

    public String getDependencyId() {
        return dependencyId;
    }

    public void setDependencyId(String dependencyId) {
        this.dependencyId = dependencyId;
    }
}