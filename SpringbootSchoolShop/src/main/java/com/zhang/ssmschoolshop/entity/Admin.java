package com.zhang.ssmschoolshop.entity;

public class Admin {
    private Integer adminid;

    private String adminname;

    private String password;

    public Admin(Integer adminid, String adminname, String password) {
        this.adminid = adminid;
        this.adminname = adminname;
        this.password = password;
    }

    public Admin() {
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}