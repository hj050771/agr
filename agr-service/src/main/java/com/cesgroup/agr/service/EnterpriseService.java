package com.cesgroup.agr.service;

import com.cesgroup.agr.constant.EntityConsts;
import com.cesgroup.agr.entity.Enterprise;
import com.cesgroup.agr.mapper.EnterpriseMapper;
import com.cesgroup.agr.utils.PageRequest;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

@Service
@Transactional(readOnly = true)
public class EnterpriseService extends BaseSevice<Enterprise, EnterpriseMapper> {

    @Override
    @Autowired
    public void setMapper(EnterpriseMapper mapper) {
        super.setMapper(mapper);
    }

    @Value("${authUrl}")
    private String authUrl;

    @Value("${provinceCode}")
    private String provinceCode;


    /**
     * 查询（分页）
     * @param pageRequest
     * @param queryObject
     * @return
     */
    public PageInfo<Enterprise> page(PageRequest pageRequest, Enterprise queryObject) {
        // 添加搜索条件：公司名称
        Example example = new Example(Enterprise.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("status", EntityConsts.VALID);
        if (StringUtil.isNotEmpty(queryObject.getName())) {
            criteria.andLike("epName", "%" + queryObject.getName() + "%");
        }

        return null;//(PageInfo<Enterprises>)super.page(pageRequest, example);
    }

    /**
     * 根据公钥获取企业信息
     */
    public Enterprise queryByPubKey(String pubKey) {
        return getMapper().selectByPubKey(pubKey);
    }

    /**
     * @param userId
     * @Description 根据用户id查询企业信息
     */
    public Enterprise queryByUserId(String userId) {
        return null;
    }

}
