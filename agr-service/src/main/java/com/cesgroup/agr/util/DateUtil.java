package com.cesgroup.agr.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * 日期处理集合类 主要功能：日期格式转换,日期比较.
 */
public class DateUtil {

  /**
   * 格式化日期以字符串形式返回.
   *
   * @param date 日期
   * @param format 格式
   * @return String
   */
  public static String format(Date date, String format) {
    if (date == null) {
      return "";
    }
    SimpleDateFormat sdf = new SimpleDateFormat(format);
    return sdf.format(date);
  }

  /**
   * 格式化日期 返回 如(2000-01-10).
   *
   * @param date
   *            日期
   * @return String
   */
  public static String toDay(Date date) {
    return format(date, "yyyy-MM-dd");
  }


}
