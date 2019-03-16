package com.cesgroup.agr.util;

import com.cesgroup.agr.vo.ObjectForQuery;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;
import java.util.List;
import java.util.Map;

/**
 * Created by TF on 2018/1/25.
 */
public interface MyMapper<T> extends Mapper<T>,MySqlMapper<T> {
    /**
     * 按条件查询
     * @param objectForQuery
     * @return
     */
    public List<?> selectList(ObjectForQuery objectForQuery);
    /**
     * 按条件查询
     * @param objectForQuery
     * @return
     */
    public List<?> selectList(T objectForQuery);
    /**
     * 指定年度进行统计，返回12个月份的数据
     * @param objectForQuery
     * @return
     */
    public List<?> countByYear(ObjectForQuery objectForQuery);
    /**
     * 指定年度进行统计，返回12个月份的数据
     * @param objectForQuery
     * @return
     */
    public List<?> countByYear(T objectForQuery);

    @UpdateProvider(type = MySqlProvider.class,method = "batchDelete")
    public void batchDelete(Map<String, Object> params,T object);

    @InsertProvider(type = MySqlProvider.class,method = "batchInsert")
    public void batchInsert(Map<String, Object> params,T object);
}
