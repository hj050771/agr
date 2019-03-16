package com.cesgroup.agr.service;

import com.cesgroup.agr.constant.EntityConsts;
import com.cesgroup.agr.entity.BaseEntity;
import com.cesgroup.agr.util.MyMapper;
import com.cesgroup.agr.utils.LngLatUtil;
import com.cesgroup.agr.utils.PrimaryKey;
import com.cesgroup.agr.vo.ObjectForQuery;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.binding.BindingException;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TF on 2018/2/1.
 */
@Transactional(readOnly = true)
public class BaseSevice<Entity extends BaseEntity, Mapper extends MyMapper> {

    private Mapper mapper;

    /**
     * 查询时的排序字段拼接的字符串
     */
    private String orderClause;

    public Mapper getMapper() {
        return mapper;
    }

    public void setMapper(Mapper mapper) {
        this.mapper = mapper;
    }

    public String getOrderClause() {
        return orderClause;
    }

    public void setOrderClause(String orderClause) {
        this.orderClause = orderClause;
    }

    protected void preInsert(BaseEntity e) {
        e.setId(PrimaryKey.getKey());
        e.setDeleteFlg(EntityConsts.VALID);
        e.setCreateTime(new Timestamp(System.currentTimeMillis()));
    }

    protected void preDelete(BaseEntity e) {
        e.setDeleteFlg(EntityConsts.INVALID);
    }

    protected void preUpdate(BaseEntity e) {
        e.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        e.setCreateTime(null);
    }

    public Entity selectOne(String id) {
        return (Entity) getMapper().selectByPrimaryKey(id);
    }

    @Transactional
    public Entity update(Entity e) {
        this.preUpdate(e);
        getMapper().updateByPrimaryKeySelective(e);
        return e;
    }

    @Transactional
    public void delete(String id) {
        Entity e = this.selectOne(id);
        this.preDelete(e);
        getMapper().updateByPrimaryKeySelective(e);
    }

    @Transactional
    public void batchDelete(List<Entity> entities) {
        if (entities != null && entities.size() > 0) {
            Map<String, Object> params = new HashMap<>(1);
            params.put("entities", entities);
            getMapper().batchDelete(params, entities.get(0));
        }
    }

    @Transactional
    public void batchInsert(List<Entity> entities) {
        Map<String, Object> params = new HashMap<>(1);
        params.put("entities", entities);
        getMapper().batchInsert(params, entities.get(0));
    }

    /**
     * 查询所有，在子类里调用
     *
     * @param example 封装了查询条件的Example实例
     * @return
     */
    public List<?> list(Example example) {
        if (StringUtils.isNotEmpty(getOrderClause())) {
            example.setOrderByClause(getOrderClause());
        }
        List<?> list = (List<?>) getMapper().selectByExample(example);
        return list;
    }

    @Transactional
    public Entity insert(Entity e) {
        this.preInsert(e);
        getMapper().insert(e);
        return e;
    }

    /**
     * 查询所有，可在子类里重写
     *
     * @param queryObject 包装了查询条件的对象
     * @return
     */
    public List<?> list(ObjectForQuery queryObject) {
        queryObject.setStatus(EntityConsts.VALID);
        return getMapper().selectList(queryObject);
    }

    /**
     * 查询所有，可在子类里重写
     *
     * @param entityForQuery 传递查询条件的实体
     * @return
     */
    public List<?> list(Entity entityForQuery) {
        List<?> list = null;

        entityForQuery.setDeleteFlg(EntityConsts.VALID);
        try {
            list = getMapper().selectList(entityForQuery);
        } catch (BindingException e) {
            // 如果*Mapper.xml里没有写selectList，默认调用下面的方法
            list = getMapper().select(entityForQuery);
        }
        return list;
    }

    /**
     * 查询所有，需在子类里重写
     *
     * @param entityForQuery
     * @param otherParams    其他参数
     * @return
     */
    public List<?> list(Entity entityForQuery, String... otherParams) {
        entityForQuery.setDeleteFlg(EntityConsts.VALID);
        return getMapper().select(entityForQuery);
    }

    /**
     * 统计，可在子类里重写
     *
     * @param queryObject 包装了查询条件的对象
     * @return
     */
    public List<?> count(ObjectForQuery queryObject) {
        queryObject.setStatus(EntityConsts.VALID);
        return getMapper().countByYear(queryObject);
    }

    /**
     * 统计，可在子类里重写
     *
     * @param queryObject 包装了查询条件的对象
     * @return
     */
    public List<?> count(Entity queryObject) {
        queryObject.setDeleteFlg(EntityConsts.VALID);
        return getMapper().countByYear(queryObject);
    }

    public void setLngLatAround(ObjectForQuery query){
        if (query.getcLat() != null && query.getcLng() != null && query.getRaidus() != null) {
            double[] around = LngLatUtil.getAround(query.getcLat(),query.getcLng(),query.getRaidus());
            query.setMinLat(around[0]);
            query.setMinLng(around[1]);
            query.setMaxLat(around[2]);
            query.setMaxLng(around[3]);
        }
    }
}
