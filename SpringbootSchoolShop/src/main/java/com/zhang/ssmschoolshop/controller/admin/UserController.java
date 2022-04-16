package com.zhang.ssmschoolshop.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.zhang.ssmschoolshop.entity.OrderCode;
import com.zhang.ssmschoolshop.entity.User;
import com.zhang.ssmschoolshop.entity.UserExample;
import com.zhang.ssmschoolshop.service.OrderCodeService;
import com.zhang.ssmschoolshop.service.UserService;
import com.zhang.ssmschoolshop.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderCodeService orderCodeService;

    @RequestMapping("/showjson")
    @ResponseBody
    public Msg getAllGoods(@RequestParam(value = "page", defaultValue = "1") Integer pn, HttpServletResponse response, Model model) {
        //一页显示几个数据
        PageHelper.startPage(pn, 10);
        List<User> userList = userService.selectByExample(new UserExample());
        //显示几个页号
        PageInfo page = new PageInfo(userList, 5);

        /* model.addAttribute("pageInfo", page);*/

        return Msg.success("查询成功!").add("pageInfo", page);
    }


    @RequestMapping("/showCodejson")
    @ResponseBody
    public Msg getAllCode(@RequestParam(value = "page", defaultValue = "1") Integer pn, HttpServletResponse response, Model model) {
        //一页显示几个数据
        PageHelper.startPage(pn, 10);
        List<OrderCode> orderCodeList = orderCodeService.findAllOrderCode();
        //显示几个页号
        PageInfo page = new PageInfo(orderCodeList, 5);

        /* model.addAttribute("pageInfo", page);*/

        return Msg.success("查询成功!").add("pageInfo", page);
    }




    @RequestMapping("/show")
    public String userManage() {
        return "userManage";
    }


    @RequestMapping("/showCode")
    public String userManageCode() {
        return "orderCodeManage";
    }

    @RequestMapping(value = "/delete/{userid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteUser(@PathVariable("userid") Integer userid) {
//        goodsService.deleteGoodsById(goodsid);
        userService.deleteUserById(userid);
        return Msg.success("删除成功!");
    }

    @RequestMapping("/testcode")
    @ResponseBody
    public void getAllGoods() {
        orderCodeService.deleteByCodeId(46);
        OrderCode orderCode = new OrderCode();
        orderCode.setCode("2131231");
        orderCode.setOrderId(43);
        orderCodeService.insertOrderCode(orderCode);
        System.out.println(orderCodeService.selectByPrimaryKey(43));
    }
    @RequestMapping("/testcode2")
    @ResponseBody
    public void getAllGoods2() {
        orderCodeService.deleteByCodeId(46);
        OrderCode orderCode = new OrderCode();
        orderCode.setCode("2131231");
        orderCode.setOrderId(43);
        orderCodeService.insertOrderCode(orderCode);
        System.out.println(orderCodeService.selectByPrimaryKey(43));
    }
}
