package com.cesgroup.agr.mapper;

import org.apache.ibatis.annotations.Param;

import com.cesgroup.agr.entity.Enterprise;
import com.cesgroup.agr.util.MyMapper;

public interface EnterpriseMapper extends MyMapper<Enterprise> {
	
	Enterprise selectByPubKey(@Param("pubKey")String pubKey);

	Enterprise selectById(@Param("id")String id);
	
}