package com.cesgroup.agr.service;

import com.cesgroup.agr.constant.EntityConsts;
import com.cesgroup.agr.dto.LoginInfo;
import com.cesgroup.agr.entity.Accounts;
import com.cesgroup.agr.exceptions.ServiceException;
import com.cesgroup.agr.mapper.AccountsMapper;
import com.cesgroup.agr.utils.EncrypAES;
import com.cesgroup.agr.utils.PrimaryKey;
import com.cesgroup.agr.utils.SHA256Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import java.sql.Timestamp;


@Service
@Transactional(readOnly = true)
public class AccountsService  {

    @Autowired
    private AccountsMapper accountsMapper;

    @Value("${encodeRules}")
    private String encodeRules;

    @Transactional
    public Accounts insert(Accounts e) {
        e.setId(PrimaryKey.getKey());
        e.setDeleteFlg(EntityConsts.VALID);
        e.setCreateTime(new Timestamp(System.currentTimeMillis()));
        e.setPassword(SHA256Util.getSHA256Str(e.getPassword()));
        accountsMapper.insert(e);
        return e;
    }

    @Transactional
    public int changePassword(String id,String password){
        Accounts accounts = new Accounts();
        accounts.setId(id);
        accounts = accountsMapper.selectByPrimaryKey(accounts);
        accounts.setPassword(SHA256Util.getSHA256Str(password));
        return accountsMapper.updateByPrimaryKeySelective(accounts);
    }

    public Accounts selectByLoginName(String loginName){
        Example example = new Example(Accounts.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("loginName",loginName);
        return  accountsMapper.selectOneByExample(example);
    }

    public Accounts selectById(String id){
        return  accountsMapper.selectByPrimaryKey(id);
    }

    public LoginInfo login(Accounts account){
       Accounts accounts = this.selectByLoginName(account.getLoginName());
       if(accounts==null){
           throw new ServiceException("用户名不存在！");
       }
       if(!SHA256Util.getSHA256Str(account.getPassword()).equals(accounts.getPassword())){
           throw new ServiceException("密码错误！");
       }
       LoginInfo loginInfo = new LoginInfo();
       loginInfo.setAccounts(accounts);
       loginInfo.setAuthToken(EncrypAES.encrypt(SHA256Util.getSHA256Str(account.getLoginName()),encodeRules).replace("+",""));
       return loginInfo;
    }

    @Transactional
    public int update(String id,Accounts account) {
        account = accountsMapper.selectByPrimaryKey(id);
        return accountsMapper.updateByPrimaryKeySelective(account);
    }
}
