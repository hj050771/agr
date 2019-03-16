package com.cesgroup.agr.util;

import com.cesgroup.agr.entity.BaseEntity;
import com.cesgroup.agr.utils.ComUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: MySqlProvider
 * @Description: 
 * @author huorujiao
 * @date 2019-02-20
 */
public class MySqlProvider {

    public String batchDelete(Map<String, Object> params, BaseEntity entity) {
        String tableName = getTableName(entity.getClass());
        StringBuilder ids = new StringBuilder();
        List<BaseEntity> baseEntities = (List<BaseEntity>) params.get("entities");
        for (int i = 0; i < baseEntities.size(); i++) {
            ids.append("'").append(baseEntities.get(i).getId()).append("'").append(",");
        }
        ids.deleteCharAt(ids.length() - 1);
        StringBuilder deleteSql = new StringBuilder();
        deleteSql.append(" update ").append(tableName).append(" set status=0 ").append(" where id in (").append(ids).append(")");
        return deleteSql.toString();
    }

    public String batchInsert(Map<String, Object> params, BaseEntity entity) {
        List baseEntities = (List) params.get("entities");
        String tableName = getTableName(entity.getClass());
        Field[] fields = getFields(entity.getClass());
        StringBuilder insertSql = new StringBuilder();
        StringBuilder valuesSql = new StringBuilder();
        insertSql.append("insert into ").append(tableName).append("(");
        try {
            for (int i = 0; i < fields.length; i++) {
                Field field = fields[i];
                Transient transt = field.getAnnotation(Transient.class);
                if(transt!=null){
                    continue;
                }
                Column column = field.getAnnotation(Column.class);
                String columnName = "";
                if (column != null) {
                    columnName = column.name();
                }
                if (StringUtils.isEmpty(columnName)) {
                    columnName = ComUtils.toUnderscoreName(field.getName());
                }
                field.setAccessible(true);
                insertSql.append(columnName);
                //if (i != fields.length - 1) {
                    insertSql.append(",");
                //}
            }
            insertSql.deleteCharAt(insertSql.length()-1);
            for (int i = 0; i < baseEntities.size(); i++) {
                valuesSql.append("(");
                for (int j = 0; j < fields.length; j++) {
                    Transient transt = fields[j].getAnnotation(Transient.class);
                    if(transt!=null){
                        continue;
                    }
                    PropertyDescriptor pd = new PropertyDescriptor(fields[j].getName(), baseEntities.get(i).getClass());
                    if (fields[j].getGenericType().getTypeName().equals("java.lang.String") || fields[j].getGenericType().getTypeName().equals("java.util.Date")) {
                        if (pd.getReadMethod().invoke(baseEntities.get(i)) != null) {
                            valuesSql.append("'");
                            valuesSql.append(pd.getReadMethod().invoke(baseEntities.get(i)));
                            valuesSql.append("'");
                        } else {
                            valuesSql.append(pd.getReadMethod().invoke(baseEntities.get(i)));
                        }
                    } else {
                        valuesSql.append(pd.getReadMethod().invoke(baseEntities.get(i)));
                    }
                    //if (j != fields.length - 1) {
                        valuesSql.append(",");
                    //}
                }
                valuesSql = valuesSql.deleteCharAt(valuesSql.length()-1);
                if (i != baseEntities.size() - 1) {
                    valuesSql.append("),");
                } else {
                    valuesSql.append(");");
                }
            }
        } catch (Exception e) {
            new RuntimeException("get insert sql is exceptoin:" + e);
        }
        insertSql.append(")").append(" values").append(valuesSql.toString());
        return insertSql.toString();
    }

    /**
     * @description: 获取实体类对应的表名
     */
    public static String getTableName(Class<?> clazz) {
        Table annotation = clazz.getAnnotation(Table.class);
        if (annotation != null) {
            return annotation.name();
        }
        return null;
    }

    /**
     * @description: 获取实体类的字段
     */
    private Field[] getFields(Class<?> beanClass) {
        Field[] beanFields = beanClass.getDeclaredFields();
        Class<?> beanSuperClass = beanClass.getSuperclass();
        Field[] beanSuperFields = beanSuperClass.getDeclaredFields();
        return ArrayUtils.addAll(beanFields, beanSuperFields);
    }
}
