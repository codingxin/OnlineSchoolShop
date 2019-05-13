package com.zhang.ssmschoolshop.entity;

import java.util.Date;

/**
 * 聊天
 */
public class Chat {
    private Integer chatid;

    private Integer senduser;

    private Integer receiveuser;

    private String msgcontent;

    private Date msgtime;

    public Integer getChatid() {
        return chatid;
    }

    public void setChatid(Integer chatid) {
        this.chatid = chatid;
    }

    public Integer getSenduser() {
        return senduser;
    }

    public void setSenduser(Integer senduser) {
        this.senduser = senduser;
    }

    public Integer getReceiveuser() {
        return receiveuser;
    }

    public void setReceiveuser(Integer receiveuser) {
        this.receiveuser = receiveuser;
    }

    public String getMsgcontent() {
        return msgcontent;
    }

    public void setMsgcontent(String msgcontent) {
        this.msgcontent = msgcontent == null ? null : msgcontent.trim();
    }

    public Date getMsgtime() {
        return msgtime;
    }

    public void setMsgtime(Date msgtime) {
        this.msgtime = msgtime;
    }
}