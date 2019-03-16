package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cesgroup.agr.entity.ComplaintPraise;
import com.cesgroup.agr.mapper.ComplaintPraiseMapper;

/** 
 * @ClassName ComplaintPraiseService.java
 * @Description 投诉与表扬
 * @author huorujiao
 * @date 创建时间：2019年2月27日 上午09:30:34   
 */

@Service
public class ComplaintPraiseService extends BaseSevice<ComplaintPraise, ComplaintPraiseMapper>{
	
	@Autowired
	public void setMapper(ComplaintPraiseMapper mapper) {
		super.setMapper(mapper);
	}
	
	
	
}
