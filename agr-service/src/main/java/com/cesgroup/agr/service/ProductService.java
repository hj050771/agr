package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.Product;
import com.cesgroup.agr.mapper.ProductMapper;

/** 
 * @ClassName ProductService.java
 * @Description 商品表
 * @author huorujiao
 * @date 创建时间：2019年2月26日 下午5:10:51   
 */

@Service
public class ProductService extends BaseSevice<Product, ProductMapper>{
	
	@Autowired
	public void setMapper(ProductMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
