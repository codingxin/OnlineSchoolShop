package com.zhang.ssmschoolshop.config.rabbitmq;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * @author codingzx
 * @description
 * @date 2021/3/30 19:21
 */
@Configuration
public class DeadExchangeConfig {


    @Bean
    public Queue getNormalQueue() {
        Map<String, Object> map = new HashMap<>();
        map.put("x-dead-letter-exchange", "deadExchange");
        map.put("x-dead-letter-routing-key", "deadmessage");
        map.put("x-message-ttl", 1000);
        return new Queue("normalQueue", true, false, false, map);
    }

    @Bean
    public DirectExchange getDirectExchange() {
        return new DirectExchange("normalExchange", true, false);
    }

    @Bean
    Binding bindingExchangeMessage3() {
        return BindingBuilder.bind(getNormalQueue()).to(getDirectExchange()).with("normal");
    }

    @Bean
    public Queue geDeadQueue() {
        return new Queue("deadQueue", true, false, false);
    }

    @Bean
    public DirectExchange getDeadDirectExchange() {
        return new DirectExchange("deadExchange", true, false);
    }

    @Bean
    Binding bindingDeadExchangeMessage() {
        return BindingBuilder.bind(geDeadQueue()).to(getDeadDirectExchange()).with("deadmessage");
    }

    /**
     * 序列化机制为JSON
     *
     * @return
     */
    @Bean
    public MessageConverter messageConverter() {
        return new Jackson2JsonMessageConverter();
    }
}
