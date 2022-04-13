package com.zhang.ssmschoolshop.controller.admin;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhang.ssmschoolshop.entity.*;
import com.zhang.ssmschoolshop.service.EmailService;
import com.zhang.ssmschoolshop.service.GoodsService;
import com.zhang.ssmschoolshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private GoodsService goodsService;


    @Autowired
    private EmailService emailService;

    @RequestMapping("/send")
    public String sendOrder(@RequestParam(value = "page",defaultValue = "1")Integer pn, Model model, HttpSession session) {

        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }

        //一页显示几个数据
        PageHelper.startPage(pn, 2);

        //查询未发货订单
        OrderExample orderExample = new OrderExample();
        orderExample.or().andIssendEqualTo(false);
        List<Order> orderList = orderService.selectOrderByExample(orderExample);
        model.addAttribute("sendOrder", orderList);

        //查询该订单中的商品
        for (int i = 0; i < orderList.size(); i++) {
            //获取订单项中的goodsid
            Order order = orderList.get(i);
            OrderItemExample orderItemExample = new OrderItemExample();
            orderItemExample.or().andOrderidEqualTo(order.getOrderid());
            List<OrderItem> orderItemList = orderService.getOrderItemByExample(orderItemExample);
            List<Integer> goodsIdList = new ArrayList<>();

            List<Goods> goodsList = new ArrayList<>();
            for (OrderItem orderItem : orderItemList) {
//                goodsIdList.add(orderItem.getGoodsid());
                Goods goods = goodsService.selectById(orderItem.getGoodsid());
                goods.setNum(orderItem.getNum());
                goodsList.add(goods);
            }

            //根据goodsid查询商品
            /*GoodsExample goodsExample = new GoodsExample();
            goodsExample.or().andGoodsidIn(goodsIdList);
            List<Goods> goodsList = goodsService.selectByExample(goodsExample);*/
            order.setGoodsInfo(goodsList);

            //查询地址
            Address address = orderService.getAddressByKey(order.getAddressid());
            order.setAddress(address);

            orderList.set(i, order);
        }

        //显示几个页号
        PageInfo page = new PageInfo(orderList,5);
        model.addAttribute("pageInfo", page);

        return "adminAllOrder";
    }

    @RequestMapping("/sendGoods")
    public String sendGoods(Integer orderid, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        Order order = new Order();
        order.setOrderid(orderid);
        order.setIssend(true);
        orderService.updateOrderByKey(order);
        // 发送信息给用户 管理员已经发货了
//        emailService.sendEmailToUser();
        return "redirect:/admin/order/send";
    }

    @RequestMapping("/receiver")
    public String receiveOrder(@RequestParam(value = "page",defaultValue = "1")Integer pn, Model model, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        //一页显示几个数据
        PageHelper.startPage(pn, 2);

        //查询未收货订单
        OrderExample orderExample = new OrderExample();
        orderExample.or().andIssendEqualTo(true).andIsreceiveEqualTo(false);
        List<Order> orderList = orderService.selectOrderByExample(orderExample);
        model.addAttribute("sendOrder", orderList);

        //查询该订单中的商品
        for (int i = 0; i < orderList.size(); i++) {
            //获取订单项中的goodsid
            Order order = orderList.get(i);
            OrderItemExample orderItemExample = new OrderItemExample();
            orderItemExample.or().andOrderidEqualTo(order.getOrderid());
            List<OrderItem> orderItemList = orderService.getOrderItemByExample(orderItemExample);
            List<Integer> goodsIdList = new ArrayList<>();
            /*for (OrderItem orderItem : orderItemList) {
                goodsIdList.add(orderItem.getGoodsid());
            }
*/
            List<Goods> goodsList = new ArrayList<>();
            for (OrderItem orderItem : orderItemList) {
//                goodsIdList.add(orderItem.getGoodsid());
                Goods goods = goodsService.selectById(orderItem.getGoodsid());
                goods.setNum(orderItem.getNum());
                goodsList.add(goods);
            }
            //根据goodsid查询商品
           /* GoodsExample goodsExample = new GoodsExample();
            goodsExample.or().andGoodsidIn(goodsIdList);
            List<Goods> goodsList = goodsService.selectByExample(goodsExample);*/
            order.setGoodsInfo(goodsList);

            //查询地址
            Address address = orderService.getAddressByKey(order.getAddressid());
            order.setAddress(address);

            orderList.set(i, order);
        }

        //显示几个页号
        PageInfo page = new PageInfo(orderList,5);
        model.addAttribute("pageInfo", page);

        return "adminOrderReceive";
    }

    @RequestMapping("/complete")
    public String completeOrder(@RequestParam(value = "page", defaultValue = "1") Integer pn, Model model, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        //一页显示几个数据
        PageHelper.startPage(pn, 2);

        //查询已完成订单
        OrderExample orderExample = new OrderExample();
        orderExample.or().andIssendEqualTo(true).andIsreceiveEqualTo(true).andIscompleteEqualTo(true);
        List<Order> orderList = orderService.selectOrderByExample(orderExample);
        model.addAttribute("sendOrder", orderList);

        //查询该订单中的商品
        for (int i = 0; i < orderList.size(); i++) {
            //获取订单项中的goodsid
            Order order = orderList.get(i);
            OrderItemExample orderItemExample = new OrderItemExample();
            orderItemExample.or().andOrderidEqualTo(order.getOrderid());
            List<OrderItem> orderItemList = orderService.getOrderItemByExample(orderItemExample);
            List<Integer> goodsIdList = new ArrayList<>();
            /*for (OrderItem orderItem : orderItemList) {
                goodsIdList.add(orderItem.getGoodsid());
            }*/

            List<Goods> goodsList = new ArrayList<>();
            for (OrderItem orderItem : orderItemList) {
//                goodsIdList.add(orderItem.getGoodsid());
                Goods goods = goodsService.selectById(orderItem.getGoodsid());
                goods.setNum(orderItem.getNum());
                goodsList.add(goods);
            }

            //根据goodsid查询商品
            /*GoodsExample goodsExample = new GoodsExample();
            goodsExample.or().andGoodsidIn(goodsIdList);
            List<Goods> goodsList = goodsService.selectByExample(goodsExample);*/
            order.setGoodsInfo(goodsList);

            //查询地址
            Address address = orderService.getAddressByKey(order.getAddressid());
            order.setAddress(address);

            orderList.set(i, order);
        }

        //显示几个页号
        PageInfo page = new PageInfo(orderList, 5);
        model.addAttribute("pageInfo", page);
        return "adminOrderComplete";
    }
}
