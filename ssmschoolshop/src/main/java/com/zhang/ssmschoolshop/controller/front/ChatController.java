package com.zhang.ssmschoolshop.controller.front;


import com.zhang.ssmschoolshop.entity.*;
import com.zhang.ssmschoolshop.service.ChatService;
import com.zhang.ssmschoolshop.service.UserService;
import com.zhang.ssmschoolshop.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class ChatController {

    @Autowired
    ChatService chatService;

    @Autowired
    UserService userService;

    @RequestMapping("/chat")
    public String showChat(HttpSession session, Model model, Integer sendto) {
        User loginuser = (User) session.getAttribute("user");
        if (loginuser == null) {
            return "redirect:/login";
        }
        /*//查询历史消息聊天对象
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        ChatExample chatExample = new ChatExample();
        chatExample.or().andReceiveuserEqualTo(user.getUserid());
//        chatExample.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList1 = chatService.selectChatByExample(chatExample);

        ChatExample chatExample2 = new ChatExample();
//        chatExample.or().andReceiveuserEqualTo(user.getUserid());
        chatExample2.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList2 = chatService.selectChatByExample(chatExample2);

        //获取userid列表
        List<Integer> useridList = new ArrayList<>();
        for (Chat chat : chatList1) {
            useridList.add(chat.getSenduser());
        }
        for (Chat chat : chatList2) {
            useridList.add(chat.getReceiveuser());
        }

        //获取用户信息
        UserExample userExample = new UserExample();
        userExample.or().andUseridIn(useridList);
        List<User> userList = userService.selectByExample(userExample);
        model.addAttribute("chatuserlist", userList);*/

        if (sendto != null) {
            User user = userService.selectByPrimaryKey(sendto);
            model.addAttribute("sendto", user);
        }
        return "chat";
    }


    @RequestMapping("/chatto")
    @ResponseBody
    public Msg getChatTo(HttpSession session, Model model, Integer sendto) {
        //查询历史消息聊天对象
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return Msg.fail("未登录");
        }
        ChatExample chatExample = new ChatExample();
        chatExample.or().andReceiveuserEqualTo(user.getUserid());
//        chatExample.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList1 = chatService.selectChatByExample(chatExample);

        ChatExample chatExample2 = new ChatExample();
//        chatExample.or().andReceiveuserEqualTo(user.getUserid());
        chatExample2.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList2 = chatService.selectChatByExample(chatExample2);

        //获取userid列表
        List<Integer> useridList = new ArrayList<>();
        for (Chat chat : chatList1) {
            useridList.add(chat.getSenduser());
        }
        for (Chat chat : chatList2) {
            useridList.add(chat.getReceiveuser());
        }

        if (sendto != null) {
            useridList.add(sendto);
        }

        //获取用户信息
        UserExample userExample = new UserExample();
        userExample.or().andUseridIn(useridList);
        List<User> userList = userService.selectByExample(userExample);

        return Msg.success("获取聊天列表成功").add("userlist",userList);
    }


    @RequestMapping("/getMessage")
    @ResponseBody
    public Msg getMessageInfo(Integer senduser, Integer receiveuser, HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return Msg.fail("未登录");
        }

        ChatExample chatExample = new ChatExample();
        chatExample.or().andReceiveuserEqualTo(senduser).andSenduserEqualTo(receiveuser);
        chatExample.or().andSenduserEqualTo(senduser).andReceiveuserEqualTo(receiveuser);
        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList = chatService.selectChatByExample(chatExample);

        return Msg.success("获取消息成功").add("message", chatList);
    }

    @RequestMapping("/admin/chat")
    public String frontChat(Integer sendto, Model model, HttpSession session) {

        Admin adminuser = (Admin) session.getAttribute("admin");
        if (adminuser == null) {
            return "redirect:/admin/login";
        }

        if (sendto != null) {
            User user = userService.selectByPrimaryKey(sendto);
            model.addAttribute("sendto", user);
        }
        return "adminChat";
    }

    @RequestMapping("/adminchat")
    @ResponseBody
    public Msg adminChat(HttpSession session, Model model, Integer sendto) {

        //查询历史消息聊天对象
        Admin adminuser = (Admin) session.getAttribute("admin");
        if (adminuser == null) {
            return Msg.fail("请先登录");
        }
        Integer userid = 5;
        ChatExample chatExample = new ChatExample();
        chatExample.or().andReceiveuserEqualTo(userid);
//        chatExample.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList1 = chatService.selectChatByExample(chatExample);

        ChatExample chatExample2 = new ChatExample();
//        chatExample.or().andReceiveuserEqualTo(user.getUserid());
        chatExample2.or().andSenduserEqualTo(userid);
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList2 = chatService.selectChatByExample(chatExample2);

        //获取userid列表
        List<Integer> useridList = new ArrayList<>();
        for (Chat chat : chatList1) {
            useridList.add(chat.getSenduser());
        }
        for (Chat chat : chatList2) {
            useridList.add(chat.getReceiveuser());
        }

        if (sendto != null) {
            useridList.add(sendto);
        }

        //获取用户信息
        UserExample userExample = new UserExample();
        userExample.or().andUseridIn(useridList);
        List<User> userList = userService.selectByExample(userExample);
//        model.addAttribute("chatuserlist", userList);
        return Msg.success("获取列表成功").add("userlist",userList);
    }

    @RequestMapping("/sendMessage")
    @ResponseBody
    public Msg saveMessage(Chat chat) {
//        System.out.println(chat.getMsgcontent());
        chat.setMsgtime(new Date());
        chatService.insertChatSelective(chat);
        return Msg.success("保存成功");
    }

    @RequestMapping("/chatrobot")
    public String showChatRobot() {
        return "chatrobot";
    }
}
