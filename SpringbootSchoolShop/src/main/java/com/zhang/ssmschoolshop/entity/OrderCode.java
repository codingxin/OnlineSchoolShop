package com.zhang.ssmschoolshop.entity;

import lombok.Data;
import lombok.ToString;

/**
 * 订单验证码
 */
@ToString
@Data
public class OrderCode {

    private Integer orderId;

    private String code;
}