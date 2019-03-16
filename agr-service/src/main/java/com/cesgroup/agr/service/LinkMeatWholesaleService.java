package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.LinkMeatWholesale;
import com.cesgroup.agr.mapper.LinkMeatWholesaleMapper;

/** 
 * @ClassName LinkMeatWholesaleService.java
 * @Description 肉类进场与屠宰场信息关联表
 * @author huorujiao
 * @date 创建时间：2019年3月1日 上午10:10:23   
 */

@Service
public class LinkMeatWholesaleService extends BaseSevice<LinkMeatWholesale, LinkMeatWholesaleMapper>{
	
	@Autowired
	public void setMapper(LinkMeatWholesaleMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
