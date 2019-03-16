package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.Customer;
import com.cesgroup.agr.mapper.CustomerMapper;

/** 
 * @ClassName CustomerService.java
 * @Description 客户（供应商）信息
 * @author huorujiao
 * @date 创建时间：2019年2月27日 下午1:07:51   
 */

@Service
public class CustomerService extends BaseSevice<Customer, CustomerMapper>{
	
	@Autowired
	public void setMapper(CustomerMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
