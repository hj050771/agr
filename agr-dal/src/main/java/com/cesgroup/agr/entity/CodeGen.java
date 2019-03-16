package com.cesgroup.agr.entity;

import java.io.Serializable;

public class CodeGen extends BaseEntity  implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * 表名
     */
    private String tableName;
    
    /**
     * 编号字段名
     */
    private String numColName;
    
    /**
     * 编号
     */
    private String number;

    /**
     * 前置号码
     */
    private String prefix = "";
    
    /**
     * 获取表名
     *
     * @return tableName - 表名
     */
    public String getTableName() {
        return tableName;
    }

    /**
     * 设置表名
     *
     * @param tableName 表名
     */
    public void setTableName(String tableName) {
        this.tableName = tableName == null ? null : tableName.trim();
    }
    
    /**
     * 获取编号字段名
     *
     * @return numColName - 编号字段名
     */
    public String getNumColName() {
        return numColName;
    }

    /**
     * 设置编号字段名
     *
     * @param numColName 编号字段名
     */
    public void setNumColName(String numColName) {
        this.numColName = numColName == null ? null : numColName.trim();
    }
    
    /**
     * 获取编号
     *
     * @return number - 编号
     */
    public String getNumber() {
        return number;
    }

    /**
     * 设置编号
     *
     * @param number 编号
     */
    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }
    
    /**
     * 获取前置号码
     *
     * @return prefix - 前置号码
     */
    public String getPrefix() {
        return prefix;
    }

    /**
     * 设置前置号码
     *
     * @param prefix 前置号码
     */
    public void setPrefix(String prefix) {
        this.prefix = prefix == null ? "" : prefix.trim();
    }
}