package com.zhang.ssmschoolshop.service;


import com.zhang.ssmschoolshop.entity.OrderCode;

import java.util.List;


public interface OrderCodeService {

    public OrderCode selectByPrimaryKey(int orderId);

    public void insertOrderCode(OrderCode orderCode);

    public void deleteByCodeId(Integer orderId);


    public List<OrderCode> findAllOrderCode();

//    public void updateByPrimaryKeySelective(User user);

}
