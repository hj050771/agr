package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.MeatSale;
import com.cesgroup.agr.mapper.MeatSaleMapper;

/** 
 * @ClassName MeatSaleService.java
 * @Description 肉类销售表
 * @author huorujiao
 * @date 创建时间：2019年2月28日 下午2:10:11   
 */

@Service
public class MeatSaleService extends BaseSevice<MeatSale, MeatSaleMapper>{
	
	@Autowired
	public void setMapper(MeatSaleMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
