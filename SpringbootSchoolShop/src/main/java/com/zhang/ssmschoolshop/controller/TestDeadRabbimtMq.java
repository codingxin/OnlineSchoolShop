package com.zhang.ssmschoolshop.controller;


import com.rabbitmq.client.MessageProperties;
import com.zhang.ssmschoolshop.entity.User;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author codingzx
 * @description
 * @date 2021/3/30 19:38
 */
@RestController
public class TestDeadRabbimtMq {

    @Autowired
    RabbitTemplate rabbitTemplate;

    @GetMapping("/sendDeadMessage")
    public String sendDirectMessage2() {
        String messageId = String.valueOf(UUID.randomUUID());
        String messageData = "helloworld  , this is dead message";
        String createTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Map<String, Object> map = new HashMap<>();
        map.put("messageId", messageId);
        map.put("messageData", messageData);
        map.put("createTime", createTime);
        User user = new User();
        user.setPassword("2131231");
        user.setUserid(1);
        user.setUsername("codingzx");
        //将消息携带绑定键值：TestDirectRouting 发送到交换机TestDirectExchange

        rabbitTemplate.convertAndSend("normalExchange", "normal", user.toString());
        return "ok this is dead message ";
    }

}
