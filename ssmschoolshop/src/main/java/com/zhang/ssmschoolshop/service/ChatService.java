package com.zhang.ssmschoolshop.service;


import com.zhang.ssmschoolshop.entity.Chat;
import com.zhang.ssmschoolshop.entity.ChatExample;

import java.util.List;

public interface ChatService {
    public void insertChatSelective(Chat chat);

    public List<Chat> selectChatByExample(ChatExample chatExample);
}
