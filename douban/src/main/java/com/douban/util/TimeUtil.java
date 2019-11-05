package com.douban.util;

import java.sql.Timestamp;

public class TimeUtil {


    public static final int TIME_DIVISOR = 1000;

    public static Timestamp createTimestamp(){
        return new Timestamp(System.currentTimeMillis() / TIME_DIVISOR);
    }
}
