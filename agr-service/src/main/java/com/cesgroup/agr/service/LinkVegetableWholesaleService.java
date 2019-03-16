package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkVegetableWholesale;
import com.cesgroup.agr.mapper.LinkVegetableWholesaleMapper;

/** 
 * @ClassName LinkVegetableWholesaleService.java
 * @Description 蔬菜进场与蔬菜批发市场信息关联表
 * @author huorujiao
 * @date 创建时间：2019年3月2日 下午2:13:51   
 */

@Service
public class LinkVegetableWholesaleService extends BaseSevice<LinkVegetableWholesale, LinkVegetableWholesaleMapper>{
	
	@Autowired
	public void setMapper(LinkVegetableWholesaleMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
