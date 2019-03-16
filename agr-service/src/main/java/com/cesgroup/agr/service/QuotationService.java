package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.Quotation;
import com.cesgroup.agr.mapper.QuotationMapper;

/** 
 * @ClassName QuotationService.java
 * @Description 价格行情表
 * @author huorujiao
 * @date 创建时间：2019年2月26日 下午5:10:51   
 */

@Service
public class QuotationService extends BaseSevice<Quotation, QuotationMapper>{
	
	@Autowired
	public void setMapper(QuotationMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
