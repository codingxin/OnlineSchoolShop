package com.zhang.ssmschoolshop.entity;

import java.util.Date;

public class ShopCart extends ShopCartKey {
    private Date catedate;

    private Integer goodsnum;

    public Date getCatedate() {
        return catedate;
    }

    public void setCatedate(Date catedate) {
        this.catedate = catedate;
    }

    public Integer getGoodsnum() {
        return goodsnum;
    }

    public void setGoodsnum(Integer goodsnum) {
        this.goodsnum = goodsnum;
    }
}