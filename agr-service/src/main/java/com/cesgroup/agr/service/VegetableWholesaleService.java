package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.VegetableWholesale;
import com.cesgroup.agr.mapper.VegetableWholesaleMapper;

/** 
 * @ClassName VegetableWholesaleService.java
 * @Description 蔬菜批发市场
 * @author huorujiao
 * @date 创建时间：2019年3月1日 下午2:34:24   
 */

@Service
public class VegetableWholesaleService extends BaseSevice<VegetableWholesale, VegetableWholesaleMapper>{
	
	@Autowired
	public void setMapper(VegetableWholesaleMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
