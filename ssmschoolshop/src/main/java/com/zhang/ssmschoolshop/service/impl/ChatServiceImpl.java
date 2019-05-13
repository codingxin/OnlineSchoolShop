package com.zhang.ssmschoolshop.service.impl;


import com.zhang.ssmschoolshop.dao.ChatMapper;
import com.zhang.ssmschoolshop.entity.Chat;
import com.zhang.ssmschoolshop.entity.ChatExample;
import com.zhang.ssmschoolshop.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

    @Autowired(required = false)
    ChatMapper chatMapper;

    @Override
    public void insertChatSelective(Chat chat) {
        chatMapper.insertSelective(chat);
    }

    @Override
    public List<Chat> selectChatByExample(ChatExample chatExample) {
        return chatMapper.selectByExample(chatExample);
    }
}
