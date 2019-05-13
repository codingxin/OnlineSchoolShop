package com.zhang.ssmschoolshop.dao;


import com.zhang.ssmschoolshop.entity.ShopCart;
import com.zhang.ssmschoolshop.entity.ShopCartExample;
import com.zhang.ssmschoolshop.entity.ShopCartKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopCartMapper {
    long countByExample(ShopCartExample example);

    int deleteByExample(ShopCartExample example);

    int deleteByPrimaryKey(ShopCartKey key);

    int insert(ShopCart record);

    int insertSelective(ShopCart record);

    List<ShopCart> selectByExample(ShopCartExample example);

    ShopCart selectByPrimaryKey(ShopCartKey key);

    int updateByExampleSelective(@Param("record") ShopCart record, @Param("example") ShopCartExample example);

    int updateByExample(@Param("record") ShopCart record, @Param("example") ShopCartExample example);

    int updateByPrimaryKeySelective(ShopCart record);

    int updateByPrimaryKey(ShopCart record);
}