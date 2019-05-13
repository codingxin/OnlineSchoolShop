package com.zhang.ssmschoolshop.dao;


import com.zhang.ssmschoolshop.entity.Deliver;
import com.zhang.ssmschoolshop.entity.DeliverExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeliverMapper {
    long countByExample(DeliverExample example);

    int deleteByExample(DeliverExample example);

    int deleteByPrimaryKey(Integer deliverid);

    int insert(Deliver record);

    int insertSelective(Deliver record);

    List<Deliver> selectByExample(DeliverExample example);

    Deliver selectByPrimaryKey(Integer deliverid);

    int updateByExampleSelective(@Param("record") Deliver record, @Param("example") DeliverExample example);

    int updateByExample(@Param("record") Deliver record, @Param("example") DeliverExample example);

    int updateByPrimaryKeySelective(Deliver record);

    int updateByPrimaryKey(Deliver record);
}