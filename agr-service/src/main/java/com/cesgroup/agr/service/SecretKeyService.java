package com.cesgroup.agr.service;

import com.cesgroup.agr.entity.SecretKey;
import com.cesgroup.agr.mapper.SecretKeyMapper;
import com.cesgroup.agr.util.SignUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: YYB
 * @description:
 * @date: 2018/5/31.
 * @modified by:
 */
@Service
@Transactional(readOnly = true)
public class SecretKeyService extends BaseSevice<SecretKey,SecretKeyMapper> {

    @Override
    @Autowired
    public void setMapper(SecretKeyMapper mapper) {
        super.setMapper(mapper);
    }

    public SecretKey select(SecretKey secretKey){
        Example example = new Example(SecretKey.class);
        Example.Criteria c = example.createCriteria();
        if(StringUtils.isNotEmpty(secretKey.getEpId())){
            c.andEqualTo("epId",secretKey.getEpId());
        }
        if(StringUtils.isNotEmpty(secretKey.getPubKey())){
            c.andEqualTo("pubKey",secretKey.getPubKey());
        }
        return getMapper().selectOneByExample(example);
    }
    /**
     * @author: YYB
     * @description: 验证公钥是否过期
     * @date: 2018/5/31
     * @modified by: 
     * @param: 
     * @return: 
     */
    public boolean isExpired(String pubKey){
        Example example = new Example(SecretKey.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("pubKey",pubKey);
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar now=Calendar.getInstance();
        c.andGreaterThan("validateAt",sdf.format(now.getTimeInMillis()));
        int cnt = getMapper().selectCountByExample(example);
        if(cnt > 0){
            return false;
        }
        return true;
    }

    /**
     * @author: YYB
     * @description: 生成密钥
     * @date: 2018/6/1
     * @modified by: 
     * @param: 
     * @return: 
     */
    @Transactional
    public SecretKey insertKey(String epId){
        SecretKey secretKey = new SecretKey();
        secretKey.setEpId(epId);
        Calendar now=Calendar.getInstance();
        StringBuilder sb  = new StringBuilder();
        sb.append(epId).append(now.getTimeInMillis());
        secretKey.setPubKey(SignUtil.genPubKey(sb.toString()));
        secretKey.setPriKey(SignUtil.genPrikey(sb.toString()));
        now.add(Calendar.MINUTE,30);
        secretKey.setValidateAt(new Date(now.getTimeInMillis()));
        return super.insert(secretKey);
    }

    /**
     * @author: YYB
     * @description: 更新密钥
     * @date: 2018/6/1
     * @modified by: 
     * @param: 
     * @return: 
     */
    @Transactional
    public SecretKey updateKey(String epId){
        Calendar now=Calendar.getInstance();
        StringBuilder sb  = new StringBuilder();
        sb.append(epId).append(now.getTimeInMillis());
        SecretKey secretKey = new SecretKey();
        secretKey.setEpId(epId);
        Example example = new Example(SecretKey.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("epId",epId);
        secretKey = getMapper().selectOneByExample(example);
        secretKey.setPubKey(SignUtil.genPubKey(sb.toString()));
        secretKey.setPriKey(SignUtil.genPrikey(sb.toString()));
        now.add(Calendar.MINUTE,30);
        secretKey.setValidateAt(new Date(now.getTimeInMillis()));
        return super.update(secretKey);
    }

    /**
     * @author: YYB
     * @description: 获取用户公钥和签名信息
     * @date: 2018/6/1
     * @modified by: 
     * @param: 
     * @return: 
     */
    public Map<String,String> getKeyInfo(String epId){
        Map<String,String> keyInfo = new HashMap<>(2);
        SecretKey secretKey = new SecretKey();
        secretKey.setEpId(epId);
        secretKey = this.select(secretKey);
        if(secretKey == null){
            secretKey = this.insertKey(epId);
        }else{
            if(this.isExpired(secretKey.getPubKey())){
                secretKey = this.updateKey(epId);
            }
        }
        keyInfo.put("pubKey",secretKey.getPubKey());
        keyInfo.put("sign", SignUtil.sign(secretKey.getPriKey()));
        return keyInfo;
    }

    /**
     * @author: ZYP
     * 根据公钥获取epId
     * @return
     */
    public String getEpId() {
        HttpServletRequest request =  ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String pubKey = request.getParameter("pubKey");
        SecretKey secretKeyForQuery = new SecretKey();
        secretKeyForQuery.setPubKey(pubKey);

        SecretKey secretKey =  select(secretKeyForQuery);

        return  secretKey.getEpId();
    }
}
