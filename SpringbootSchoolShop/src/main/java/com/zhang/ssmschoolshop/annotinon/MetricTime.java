package com.zhang.ssmschoolshop.annotinon;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author codingzx
 * @description
 * @date 2021/4/14 21:08
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface MetricTime {
    String value();
}
