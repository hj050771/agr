package com.cesgroup.agr.utils;

import java.util.UUID;

/**
 * 主键生成
 */
public class PrimaryKey {

    /**
     * 返回32位主键
     */
    public static final String getKey() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
