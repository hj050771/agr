package com.cesgroup.agr.utils;

public interface Status {
    Integer VALID = Integer.valueOf(0);
    Integer INVALID = Integer.valueOf(1);
    Integer FREEZEN = Integer.valueOf(2);
    Integer LOCKED = Integer.valueOf(3);
    Integer DISCARD = Integer.valueOf(4);
}
