package com.cesgroup.agr.vo;

import org.apache.commons.lang3.StringUtils;

/**
 * 封闭查询条件的类，用于接收前端传入的查询条件并向service层传递
 * 如没有合适的属性，可自行添加
 * Created by 张余平 on 2018/2/8.
 */
public class ObjectForQuery {
    /**
     * 关键词（可作为任意属性）
     */
    private String keyword;
    /**
     * 业务状态
     */
    private Integer businessStatus;
    /**
     * 企业id
     */
    private String epId;
    /**
     * 企业名称
     */
    private String epName;
    /**
     * 日期范围（from）
     */
    private String dateFrom;
    /**
     * 日期范围（to）
     */
    private String dateTo;

    /**
     * 年度
     */
    private String year;
    
    /**
     * 月份
     */
    private String month;

    /**
     * 是否查询当前月
     */
    private boolean queryCurMonth;

    /**
     * 数据状态（删除与否）
     */
    private Integer status;

    /**
     * 行业分类id
     */
    private String cId;
    /**
     * 行业分类id
     */
    private String[] cIds;
    /**
     * 行业分类编码
     */
    private String cCode;
    /**
     * 行业细化分类id
     */
    private String mcId;
    /**
     * 行业细化分类编码
     */
    private String mcCode;

    private String[] mcCodes;
    /**
     * 市编码
     */
    private String cityCode;
    /**
     * 区/县编码
     */
    private String countyCode;
    /**
     * 获取前多少条
     */
    private Integer top;
    /**
     * 兽医名称
     */
    private String vetName;
    
    /**
     * 兽医名称
     */
    private String cooName;
    
    /**
     * 供应商名称
     */
    private String supplierName;

    /**
     * 区域名称
     */
    private String areaName;
    
    /**
     * 防疫物资名称
     */
    private String materialName;
    /**
     * GMP证号
     */
    private String gmpNo;
    /**
     * 产品id
     */
    private String prdId;
    /**
     * 产品名称
     */
    private String prdName;
    /**
     * 产品数量
     */
    private int prdNums;

    /**
     * 许可证号
     */
    private String licenseNo;
    private String dependsId;
    
    private String mcIds;

    /**
     * 中心点纬度
     */
    private Double cLat;

    /**
     * 中心点经度
     */
    private Double cLng;

    /**
     * 半径
     */
    private Integer raidus;

    private Double minLat;
    private Double minLng;
    private Double maxLat;
    private Double maxLng;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getBusinessStatus() {
        return businessStatus;
    }

    public void setBusinessStatus(Integer businessStatus) {
        this.businessStatus = businessStatus;
    }

    public String getEpId() {
        return epId;
    }

    public void setEpId(String epId) {
        this.epId = epId;
    }

    public String getEpName() {
        return epName;
    }

    public void setEpName(String epName) {
        this.epName = epName;
    }

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        if (StringUtils.isNotEmpty(dateTo)) {
            this.dateTo = dateTo + " 23:59:59";
        }
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId;
    }

    public String[] getcIds() {
        return cIds;
    }

    public void setcIds(String[] cIds) {
        this.cIds = cIds;
    }

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String cCode) {
        this.cCode = cCode;
    }

    public String getMcId() {
        return mcId;
    }

    public void setMcId(String mcId) {
        this.mcId = mcId;
    }

    public String getMcCode() {
        return mcCode;
    }

    public void setMcCode(String mcCode) {
        this.mcCode = mcCode;
    }

    public String[] getMcCodes() {
        return mcCodes;
    }

    public void setMcCodes(String[] mcCodes) {
        this.mcCodes = mcCodes;
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

    public Integer getTop() {
        return top;
    }

    public void setTop(Integer top) {
        this.top = top;
    }

    public String getVetName() {
		return vetName;
	}

	public void setVetName(String vetName) {
		this.vetName = vetName;
	}

	public String getCooName() {
		return cooName;
	}

	public void setCooName(String cooName) {
		this.cooName = cooName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public String getGmpNo() {
		return gmpNo;
	}

	public void setGmpNo(String gmpNo) {
		this.gmpNo = gmpNo;
	}

	/**
	 * @return the month
	 */
	public String getMonth() {
		return month;
	}

	/**
	 * @param month the month to set
	 */
	public void setMonth(String month) {
		this.month = month;
	}

    public boolean getQueryCurMonth() {
        return queryCurMonth;
    }

    public void setQueryCurMonth(boolean queryCurMonth) {
        this.queryCurMonth = queryCurMonth;
    }

    public String getDependsId() {
		return dependsId;
	}

	public void setDependsId(String dependsId) {
		this.dependsId = dependsId;
	}

	public String getMcIds() {
		return mcIds;
	}

	public void setMcIds(String mcIds) {
		this.mcIds = mcIds;
	}

	public String getPrdId() {
		return prdId;
	}

	public void setPrdId(String prdId) {
		this.prdId = prdId;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public int getPrdNums() {
		return prdNums;
	}

	public void setPrdNums(int prdNums) {
		this.prdNums = prdNums;
	}

    public Double getcLat() {
        return cLat;
    }

    public void setcLat(Double cLat) {
        this.cLat = cLat;
    }

    public Double getcLng() {
        return cLng;
    }

    public void setcLng(Double cLng) {
        this.cLng = cLng;
    }

    public Integer getRaidus() {
        return raidus;
    }

    public void setRaidus(Integer raidus) {
        this.raidus = raidus;
    }

    public Double getMinLat() {
        return minLat;
    }

    public void setMinLat(Double minLat) {
        this.minLat = minLat;
    }

    public Double getMinLng() {
        return minLng;
    }

    public void setMinLng(Double minLng) {
        this.minLng = minLng;
    }

    public Double getMaxLat() {
        return maxLat;
    }

    public void setMaxLat(Double maxLat) {
        this.maxLat = maxLat;
    }

    public Double getMaxLng() {
        return maxLng;
    }

    public void setMaxLng(Double maxLng) {
        this.maxLng = maxLng;
    }
}
