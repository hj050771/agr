package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkVegetableSupplier;
import com.cesgroup.agr.mapper.LinkVegetableSupplierMapper;

/** 
 * @ClassName LinkVegetableSupplierService.java
 * @Description 商品表
 * @author huorujiao
 * @date 创建时间：2019年3月2日 上午09:20:11   
 */

@Service
public class LinkVegetableSupplierService extends BaseSevice<LinkVegetableSupplier, LinkVegetableSupplierMapper>{
	
	@Autowired
	public void setMapper(LinkVegetableSupplierMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
