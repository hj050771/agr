package com.cesgroup.agr.mapper;

import com.cesgroup.agr.entity.Enterprises;
import com.cesgroup.agr.util.MyMapper;

import com.cesgroup.agr.vo.ObjectForQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EnterprisesMapper extends MyMapper<Enterprises> {

	Enterprises selectByPubKey(@Param("pubKey")String pubKey);

	Enterprises selectById(@Param("id")String id);

	/**
	 * 根据orgId删除企业信息
	 * @param enterprises
	 */
	void deleteEnptByOrgId(Enterprises enterprises);

	/**
	 * @Description 统计各行业企业个数
	 * @param objectForQuery
	 * @return
	 */
	List<Map<String,Object>> countByIndustryCategories(ObjectForQuery objectForQuery);

	/**
	 * 企业个数统计（行业可限定为多个）
	 * @param queryObject
	 * @return
	 */
	int countMultIndustry(ObjectForQuery queryObject);

	List<Map<String,Object>> selectMultIndustry(ObjectForQuery queryObject);

	
}