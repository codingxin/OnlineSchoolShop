package com.zhang.ssmschoolshop.entity;

public class OrderItem {
    private Integer itemid;

    private Integer orderid;

    private Integer goodsid;

    private Integer num;

    public OrderItem() {
    }

    public OrderItem(Integer itemid, Integer orderid, Integer goodsid, Integer num) {

        this.itemid = itemid;
        this.orderid = orderid;
        this.goodsid = goodsid;
        this.num = num;
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}