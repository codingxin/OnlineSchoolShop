package com.zhang.ssmschoolshop.entity;

public class ImagePath {
    private Integer pathid;

    private Integer goodid;

    private String path;

    public ImagePath() {
    }

    public ImagePath(Integer pathid, Integer goodid, String path) {

        this.pathid = pathid;
        this.goodid = goodid;
        this.path = path;
    }

    public Integer getPathid() {
        return pathid;
    }

    public void setPathid(Integer pathid) {
        this.pathid = pathid;
    }

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }
}