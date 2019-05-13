package com.zhang.ssmschoolshop.entity;

public class ShopCartKey {
    private Integer userid;

    private Integer goodsid;

    public ShopCartKey() {
    }

    public ShopCartKey(Integer userid, Integer goodsid) {

        this.userid = userid;
        this.goodsid = goodsid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }
}