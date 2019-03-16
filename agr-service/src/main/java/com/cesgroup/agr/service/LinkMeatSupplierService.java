package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkMeatSupplier;
import com.cesgroup.agr.mapper.LinkMeatSupplierMapper;

/** 
 * @ClassName LinkMeatSupplierService.java
 * @Description 肉类进场与供应商关联表
 * @author huorujiao
 * @date 创建时间：2019年2月28日 下午3:01:21   
 */

@Service
public class LinkMeatSupplierService extends BaseSevice<LinkMeatSupplier, LinkMeatSupplierMapper>{
	
	@Autowired
	public void setMapper(LinkMeatSupplierMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
