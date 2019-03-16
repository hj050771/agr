package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkVegetableBrand;
import com.cesgroup.agr.mapper.LinkVegetableBrandMapper;

/** 
 * @ClassName LinkVegetableBrandService.java
 * @Description 蔬菜进场与品牌关联表
 * @author huorujiao
 * @date 创建时间：2019年3月2日 上午10:30:21   
 */

@Service
public class LinkVegetableBrandService extends BaseSevice<LinkVegetableBrand, LinkVegetableBrandMapper>{
	
	@Autowired
	public void setMapper(LinkVegetableBrandMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
