package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.VegetableSale;
import com.cesgroup.agr.mapper.VegetableSaleMapper;

/** 
 * @ClassName VegetableSaleService.java
 * @Description 蔬菜销售表
 * @author huorujiao
 * @date 创建时间：2019年3月1日 下午3:23:11   
 */

@Service
public class VegetableSaleService extends BaseSevice<VegetableSale, VegetableSaleMapper>{
	
	@Autowired
	public void setMapper(VegetableSaleMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
