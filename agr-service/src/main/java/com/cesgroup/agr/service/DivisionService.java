package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.Division;
import com.cesgroup.agr.mapper.DivisionMapper;

/** 
 * @ClassName DivisionService.java
 * @Description 产地
 * @author huorujiao
 * @date 创建时间：2019年2月28日 下午3:40:21   
 */

@Service
public class DivisionService extends BaseSevice<Division, DivisionMapper>{
	
	@Autowired
	public void setMapper(DivisionMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
