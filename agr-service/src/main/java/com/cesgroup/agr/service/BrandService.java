package com.cesgroup.agr.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import com.cesgroup.agr.constant.EntityConsts;
import com.cesgroup.agr.entity.Brand;
import com.cesgroup.agr.mapper.BrandMapper;

/** 
 * @ClassName BrandService.java
 * @Description 品牌
 * @author huorujiao
 * @date 创建时间：2019年2月26日 下午3:10:31   
 */

@Service
public class BrandService extends BaseSevice<Brand, BrandMapper>{
	
	@Autowired
	public void setMapper(BrandMapper mapper) {
		super.setMapper(mapper);
	}
	/**
	 * @Description 新增
	 * @param Brand
	 * @return void
	 */
	@Transactional
    public void insertBrand(Brand Brand) {
        super.preInsert(Brand);
        getMapper().insert(Brand);
    }
	
	/**
	 * @Description 根据id查询
	 * @param Brand
	 * @return Brand
	 */
	public Brand queryById(Brand id){
		return getMapper().selectOne(id);
	}

	
}
