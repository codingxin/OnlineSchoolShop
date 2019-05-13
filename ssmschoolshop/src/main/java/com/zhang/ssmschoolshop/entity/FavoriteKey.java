package com.zhang.ssmschoolshop.entity;

public class FavoriteKey {
    private Integer userid;

    private Integer goodsid;

    public FavoriteKey() {
    }

    public FavoriteKey(Integer userid, Integer goodsid) {

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