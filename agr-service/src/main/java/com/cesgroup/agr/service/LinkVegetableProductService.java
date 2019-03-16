package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkVegetableProduct;
import com.cesgroup.agr.mapper.LinkVegetableProductMapper;

/** 
 * @ClassName LinkVegetableProductService.java
 * @Description 蔬菜进场与商品关联表
 * @author huorujiao
 * @date 创建时间：2019年3月1日 下午3:43:33  
 */

@Service
public class LinkVegetableProductService extends BaseSevice<LinkVegetableProduct, LinkVegetableProductMapper>{
	
	@Autowired
	public void setMapper(LinkVegetableProductMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
