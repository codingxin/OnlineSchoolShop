package com.zhang.ssmschoolshop.annotinon;

/**
 * @author codingzx
 * @description
 * @date 2021/4/11 11:21
 */

import java.lang.annotation.*;

/**
 * @author created by zhangxin27695
 * @Classname ExportEntityMap
 * @Description
 * @Date 2020-03-23 8:58
 */
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ExportEntityMap {

    String EnName() default "数据库列名";

    String CnName() default "实体映射名";

}