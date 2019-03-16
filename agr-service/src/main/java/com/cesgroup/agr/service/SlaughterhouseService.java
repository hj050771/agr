package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.Slaughterhouse;
import com.cesgroup.agr.mapper.SlaughterhouseMapper;

/** 
 * @ClassName SlaughterhouseService.java
 * @Description 屠宰场信息表
 * @author huorujiao
 * @date 创建时间：2019年2月28日 上午1:23:45   
 */

@Service
public class SlaughterhouseService extends BaseSevice<Slaughterhouse, SlaughterhouseMapper>{
	
	@Autowired
	public void setMapper(SlaughterhouseMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
