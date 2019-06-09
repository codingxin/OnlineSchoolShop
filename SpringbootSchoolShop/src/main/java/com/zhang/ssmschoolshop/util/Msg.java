package com.zhang.ssmschoolshop.util;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    //100-success,200-fail
    private int code;

    //提示信息
    private String msg;

    //数据
    private Map<String, Object> info = new HashMap<String, Object>();

    public static Msg success(String msg) {
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg(msg);
        return result;
    }

    public static Msg fail(String msg) {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg(msg);
        return result;
    }

    public Msg add(String key, Object value) {
        this.getInfo().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
}
