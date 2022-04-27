package com.zhang.ssmschoolshop.config.rabbitmq;

import org.springframework.amqp.core.Message;

import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author codingzx
 * @description
 *
 *
 * 使用Jackson2JsonMessageConverter处理器，客户端发送JSON类型数据，但是没有指定消息的contentType类型，
 * 那么Jackson2JsonMessageConverter就会将消息转换成byte[]类型的消息进行消费。
 *
 * 如果指定了contentType为application/json，那么消费端就会将消息转换成Map类型的消息进行消费。
 * 如果指定了contentType为application/json，并且生产端是List类型的JSON格式，那么消费端就会将消息转换成List类型的消息进行消费。

 *
 * @date 2021/3/27 15:20
 */
@Configuration
public class RabbitmqConfig {

    @Value("${spring.rabbitmq.host}")
    private String host;
    @Value("${spring.rabbitmq.port}")
    private Integer port;
    @Value("${spring.rabbitmq.username}")
    private String username;
    @Value("${spring.rabbitmq.password}")
    private String password;

    @Bean
    public RabbitTemplate createRabbitTemplate(ConnectionFactory connectionFactory) {
        RabbitTemplate rabbitTemplate = new RabbitTemplate();
        rabbitTemplate.setConnectionFactory(connectionFactory);
        //设置开启Mandatory,才能触发回调函数,无论消息推送结果怎么样都强制调用回调函数
        rabbitTemplate.setMandatory(true);

        rabbitTemplate.setConfirmCallback(new RabbitTemplate.ConfirmCallback() {
            @Override
            public void confirm(CorrelationData correlationData, boolean ack, String cause) {
                System.out.println("ConfirmCallback:     " + "相关数据：" + correlationData);
                System.out.println("ConfirmCallback:     " + "确认情况：" + ack);
                System.out.println("ConfirmCallback:     " + "原因：" + cause);
            }
        });


//        rabbitTemplate.setReturnsCallback(new RabbitTemplate.ReturnsCallback() {
//            @Override
//            public void returnedMessage(Message message, int replyCode, String replyText, String exchange, String routingKey) {
//                System.out.println("ReturnCallback:     " + "消息：" + message);
//                System.out.println("ReturnCallback:     " + "回应码：" + replyCode);
//                System.out.println("ReturnCallback:     " + "回应信息：" + replyText);
//                System.out.println("ReturnCallback:     " + "交换机：" + exchange);
//                System.out.println("ReturnCallback:     " + "路由键：" + routingKey);
//            }
//
//            @Override
//            public void returnedMessage(ReturnedMessage returnedMessage) {
//                System.out.println("ReturnCallback:     " + "消息：" + returnedMessage.getMessage());
//                System.out.println("ReturnCallback:     " + "回应码：" + returnedMessage.getReplyCode());
//                System.out.println("ReturnCallback:     " + "回应信息：" + returnedMessage.getReplyText());
//                System.out.println("ReturnCallback:     " + "交换机：" + returnedMessage.getExchange());
//                System.out.println("ReturnCallback:     " + "路由键：" + returnedMessage.getRoutingKey());
//            }
//        });


        rabbitTemplate.setReturnCallback(new RabbitTemplate.ReturnCallback() {
            @Override
            public void returnedMessage(Message message, int i, String s, String s1, String s2) {
                System.out.println("ReturnCallback:     " + "消息：" + message);
                System.out.println("ReturnCallback:     " + "回应码：" + s);
                System.out.println("ReturnCallback:     " + "回应信息：" + s1);
                System.out.println("ReturnCallback:     " + "交换机：" + s2);
            }
        });
        return rabbitTemplate;
    }


    @Bean
    public ConnectionFactory connectionFactory() {
        CachingConnectionFactory connectionFactory = new CachingConnectionFactory(host, port);
        connectionFactory.setUsername(username);
        connectionFactory.setPassword(password);
        //设置virtualHost。
        connectionFactory.setVirtualHost("/");
        //消息的确认机制（confirm）；
        connectionFactory.setPublisherConfirms(true);
        connectionFactory.setPublisherReturns(true);
        //setCacheMode：设置缓存模式，共有两种，CHANNEL和CONNECTION模式。
        //1、CONNECTION模式，这个模式下允许创建多个Connection，会缓存一定数量的Connection，每个Connection中同样会缓存一些Channel，
        // 除了可以有多个Connection，其它都跟CHANNEL模式一样。
        //2、CHANNEL模式，程序运行期间ConnectionFactory会维护着一个Connection，
        // 所有的操作都会使用这个Connection，但一个Connection中可以有多个Channel，
        // 操作rabbitmq之前都必须先获取到一个Channel，
        // 否则就会阻塞（可以通过setChannelCheckoutTimeout()设置等待时间），
        // 这些Channel会被缓存（缓存的数量可以通过setChannelCacheSize()设置）；
        connectionFactory.setCacheMode(CachingConnectionFactory.CacheMode.CONNECTION);   //设置CONNECTION模式，可创建多个Connection连接
        //设置每个Connection中缓存Channel的数量，不是最大的。操作rabbitmq之前（send/receive message等）
        // 要先获取到一个Channel.获取Channel时会先从缓存中找闲置的Channel，如果没有则创建新的Channel，
        // 当Channel数量大于缓存数量时，多出来没法放进缓存的会被关闭。
        connectionFactory.setChannelCacheSize(10);
        //单位：毫秒；配合channelCacheSize不仅是缓存数量，而且是最大的数量。
        // 从缓存获取不到可用的Channel时，不会创建新的Channel，会等待这个值设置的毫秒数
        //同时，在CONNECTION模式，这个值也会影响获取Connection的等待时间，
        // 超时获取不到Connection也会抛出AmqpTimeoutException异常。
        connectionFactory.setChannelCheckoutTimeout(6000);

        //仅在CONNECTION模式使用，设置Connection的缓存数量。
        connectionFactory.setConnectionCacheSize(3);
        //setConnectionLimit：仅在CONNECTION模式使用，设置Connection的数量上限。
        connectionFactory.setConnectionLimit(10);
        return connectionFactory;
    }


}
