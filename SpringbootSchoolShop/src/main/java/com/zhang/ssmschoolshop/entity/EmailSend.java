package com.zhang.ssmschoolshop.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author codingzx
 * @description
 * @date 2021/3/27 21:13
 */
@Data
@ToString
public class EmailSend implements Serializable {

    /**
     * 邮件接收方，可多人
     */
    private String[] receivers;
    /**
     * 邮件主题
     */
    private String subject;
    /**
     * 邮件内容
     */
    private String content;


}
