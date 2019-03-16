package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkMeatProduct;
import com.cesgroup.agr.mapper.LinkMeatProductMapper;

/** 
 * @ClassName LinkMeatProductService.java
 * @Description 肉类进场与商品关联表
 * @author huorujiao
 * @date 创建时间：2019年2月28日 下午2:30:11   
 */

@Service
public class LinkMeatProductService extends BaseSevice<LinkMeatProduct, LinkMeatProductMapper>{
	
	@Autowired
	public void setMapper(LinkMeatProductMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
