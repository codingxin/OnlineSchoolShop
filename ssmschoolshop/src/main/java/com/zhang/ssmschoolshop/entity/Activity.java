package com.zhang.ssmschoolshop.entity;

/**
 * 促销活动
 */
public class Activity {
    private Integer activityid;

    private String activityname;

    private String activitydes;

    private Float discount;

    private Integer fullprice;

    private Integer reduceprice;

    private Integer fullnum;

    private Integer reducenum;

    public Integer getActivityid() {
        return activityid;
    }

    public void setActivityid(Integer activityid) {
        this.activityid = activityid;
    }

    public String getActivityname() {
        return activityname;
    }

    public void setActivityname(String activityname) {
        this.activityname = activityname == null ? null : activityname.trim();
    }

    public String getActivitydes() {
        return activitydes;
    }

    public void setActivitydes(String activitydes) {
        this.activitydes = activitydes == null ? null : activitydes.trim();
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Integer getFullprice() {
        return fullprice;
    }

    public void setFullprice(Integer fullprice) {
        this.fullprice = fullprice;
    }

    public Integer getReduceprice() {
        return reduceprice;
    }

    public void setReduceprice(Integer reduceprice) {
        this.reduceprice = reduceprice;
    }

    public Integer getFullnum() {
        return fullnum;
    }

    public void setFullnum(Integer fullnum) {
        this.fullnum = fullnum;
    }

    public Integer getReducenum() {
        return reducenum;
    }

    public void setReducenum(Integer reducenum) {
        this.reducenum = reducenum;
    }
}