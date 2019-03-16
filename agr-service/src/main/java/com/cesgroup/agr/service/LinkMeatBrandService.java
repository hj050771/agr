package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkMeatBrand;
import com.cesgroup.agr.mapper.LinkMeatBrandMapper;

/** 
 * @ClassName LinkMeatBrandService.java
 * @Description 肉类进场与品牌关联
 * @author huorujiao
 * @date 创建时间：2019年2月28日 下午3:30:51   
 */

@Service
public class LinkMeatBrandService extends BaseSevice<LinkMeatBrand, LinkMeatBrandMapper>{
	
	@Autowired
	public void setMapper(LinkMeatBrandMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
