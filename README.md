**OnlineSchoolShop-基于Spring boot/SSM商城的搭建教程**
加微信18229819406，提供定制化修改

微信公众号 codingzx  ，在线答疑

> API接口访问  http://127.0.0.1:8081/shop/swagger-ui.html

> 管理员访问 http://127.0.0.1:8081/shop/admin/login

> 普通用户访问 http://127.0.0.1:8081/shop/

>管理员帐号  admin 12345678

>用户帐号  root codingzx  admin  密码均为 12345678
 
 图片保存路径：  可以全局搜索后替换
 
 windows:  D:/upload
 
 linux:  /usr/upload
     

  
**技术栈**
 * 后端： SpringBoot Swagger Docker（docker需自己搭建docker环境）
 * 前端： JSP 
 * 数据库：MySQL
 * 技术语言 jdk 1.8
 * 开发平台 Idea 2018 +win10
 * 运行环境 Linux/Windows
 
毕业设计基于SSM/Springboot的商城项目，一个简单的商城，界面友好，但是不是很漂亮。实现了商城所有基本功能。
作为改写的基础模板，可以增加或者改写的功能：

1. 增加word和excel模板     ；  已实现 excel导出  和 文件导入

2. 增加redis，存储商品信息主要存储。

   增加mq，订单并发，再购物车层次上做到入库并发控制
   
3. 增加邮件发送，订单支付成功和发货成功给客户和管理员分别发送邮件     ； 已实现

4. 增加支付功能，可以用支付宝当面付，入门门槛低

5. 增加合作登陆，用QQ/微信/GITHUB等登陆，存储信息入库

6. 增加数据分析，用Echart分析数据

7. 部署采用docker和nginx做到动静分离。需要改写jsp为模板themeleaf。

8. swagger 接口在线预览   # 已实现

9. 每天定时任务，清理异常订单 并发送邮件

10. 死信队列处理延迟任务

11. html导出pdf  -  wkhtmltopdf插件

12. 



有两个版本 一个springboot，一个ssm。没有redis和mq。 <br/>

 PS:最近发现以前的毕业设计居然有很多人引用，github上的fork和star数也很多，感觉无形之间又'帮助'了很多人。
 
 本项目主要也是改写的基础的商城项目，没有任何的技巧。
 
 一.系统架构
 前端：jsp
 后台：springboot
 二.项目运行图
 用户端：
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200521172532928.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1MTgwOTcz,size_16,color_FFFFFF,t_70)
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200521172551212.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1MTgwOTcz,size_16,color_FFFFFF,t_70)
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200521172611947.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1MTgwOTcz,size_16,color_FFFFFF,t_70)
 管理员端：
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200521172649732.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1MTgwOTcz,size_16,color_FFFFFF,t_70)
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200521172710683.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1MTgwOTcz,size_16,color_FFFFFF,t_70)
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200521172724371.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1MTgwOTcz,size_16,color_FFFFFF,t_70)
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200521172738766.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1MTgwOTcz,size_16,color_FFFFFF,t_70)


# 图片不能显示

 原因：初始图片没有存储，可以在后台添加一个商品，查看图片存储路径:
 
 windows:D:/upload
 
 Linux:/usr/upload
 