package com.zhang.ssmschoolshop.dao;



import com.zhang.ssmschoolshop.entity.OrderCode;

import java.util.List;

public interface OrderCodeMapper {


    void insertOrderCode(OrderCode record);

    OrderCode findByCodeId(Integer orderId);

    void deleteByCodeId(Integer orderId);


    void updateByPrimaryKey(OrderCode record);


    List<OrderCode> findAllOrderCode();
}