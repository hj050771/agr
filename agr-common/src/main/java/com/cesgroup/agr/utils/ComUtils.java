package com.cesgroup.agr.utils;

import com.cesgroup.agr.constant.EntityConsts;

import java.math.BigDecimal;

public class ComUtils {

	/**
	 * 驼峰式命名转换为下划线命名
	 *
	 * @param camelCaseName
	 * @return
	 */
	public static String toUnderscoreName(String camelCaseName) {
		StringBuilder result = new StringBuilder();
		if (camelCaseName != null && camelCaseName.length() > 0) {
			result.append(camelCaseName.substring(0, 1).toLowerCase());
			for (int i = 1; i < camelCaseName.length(); i++) {
				char ch = camelCaseName.charAt(i);
				if (Character.isUpperCase(ch)) {
					result.append("_");
					result.append(Character.toLowerCase(ch));
				} else {
					result.append(ch);
				}
			}
		}
		return result.toString();
	}

	/**
	 * 计算增长率
	 * @param pre 前一次数量
	 * @param cur 当前数量
	 * @return 前一次数量为0时返回null
	 */
	public static BigDecimal calculateGrowth(BigDecimal pre, BigDecimal cur) {
		BigDecimal result = null;

		if(pre.compareTo(BigDecimal.ZERO) != 0) {
			// (当前数量 - 前一次数量)/前一次数量
			result = cur.subtract(pre).divide(pre, EntityConsts.RATE_SCALE, BigDecimal.ROUND_HALF_UP);
		}

		return result;
	}
}
