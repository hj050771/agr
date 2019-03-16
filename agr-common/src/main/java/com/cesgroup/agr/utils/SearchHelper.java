package com.cesgroup.agr.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * @description: 查询条件辅助类
 */
public class SearchHelper {
    public static PageRequest buildPageRequest(int pageNumber, int pageSize, String orderStrs) {
        StringBuffer orders = new StringBuffer("");
        String[] orderArray = null;
        if (StringUtils.isNotEmpty(orderStrs)) {
            if (orderStrs.indexOf(";") > 0) {
                orderArray = orderStrs.split(";");
            } else {
                orderArray = new String[1];
                orderArray[0] = orderStrs;
            }
            for (int i = 0; i < orderArray.length; i++) {
                String[] orderElements = orderArray[i].split(",");
                // 拼接排序字段
                orders.append(ComUtils.toUnderscoreName(orderElements[0]));
                // 拼接排序方向
                if(orderElements.length == 1) {
                    orders.append(" ").append("asc");
                } else {
                    orders.append(" ").append(orderElements[1]);
                }

                orders.append(",");
            }
            // 去掉最后一个逗号
            orders = orders.deleteCharAt(orders.length() - 1);
        }
        return new PageRequest(pageNumber, pageSize, orders.toString());
    }
}
