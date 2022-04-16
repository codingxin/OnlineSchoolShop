package com.zhang.ssmschoolshop.service.impl;



import com.zhang.ssmschoolshop.dao.OrderCodeMapper;
import com.zhang.ssmschoolshop.entity.OrderCode;
import com.zhang.ssmschoolshop.service.OrderCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderCodeService")
public class OrderCodeServiceImpl implements OrderCodeService {

    @Autowired(required = false)
    OrderCodeMapper orderCodeMapper;

    @Override
    public OrderCode selectByPrimaryKey(int orderId) {
        return orderCodeMapper.findByCodeId(orderId);
    }

    @Override
    public void insertOrderCode(OrderCode orderCode) {
        orderCodeMapper.insertOrderCode(orderCode);
    }

    @Override
    public void deleteByCodeId(Integer orderId) {
        orderCodeMapper.deleteByCodeId(orderId);
    }

    @Override
    public List<OrderCode> findAllOrderCode() {
        return orderCodeMapper.findAllOrderCode();
    }
}
