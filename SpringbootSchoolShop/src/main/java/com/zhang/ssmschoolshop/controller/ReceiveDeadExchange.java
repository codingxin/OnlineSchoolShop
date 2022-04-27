package com.zhang.ssmschoolshop.controller;


import com.rabbitmq.client.Channel;

import com.zhang.ssmschoolshop.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * @author codingzx
 * @description 直接队列 不处理，转交给 死信队列
 * @date 2021/3/30 19:40
 */
@Component
public class ReceiveDeadExchange {


    private static final Logger log = LoggerFactory.getLogger(ReceiveDeadExchange.class);

    //    @RabbitHandler
//    @RabbitListener(queues = "normalQueue")
    public void receiveDirectMessage(Channel channel, Message message) throws IOException {
        try {
            log.info("rabbitmq receive direct message:" + message);
//            channel.basicReject(message.getMessageProperties().getDeliveryTag(), false);
        } catch (Exception e) {
            log.info("rabbimt error :" + e);
//            channel.basicReject(message.getMessageProperties().getDeliveryTag(), false);
        } finally {
        }
    }

    @RabbitHandler
    @RabbitListener(queues = "deadQueue")
    public void receivDeadMessage(Channel channel, Message message) throws IOException {
        try {
            log.info("receive dead message:" + message);
            log.info("receive dead message body:" + message.getBody());

//            String bodyStr = new String(message.getBody(), "UTF-8");
            User user = null;
            try {
                Jackson2JsonMessageConverter jackson2JsonMessageConverter = new Jackson2JsonMessageConverter();
                user = (User) jackson2JsonMessageConverter.fromMessage(message);
            } catch (Exception e) {
                log.info("get order fromBytes message exception" + e.getMessage());
            }
            log.info("user  is :", user);
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (Exception e) {
            log.info("rabbimt error :" + e);
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } finally {
        }
    }


}
