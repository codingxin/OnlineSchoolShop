package com.zhang.ssmschoolshop.service;


import com.zhang.ssmschoolshop.entity.Comment;
import com.zhang.ssmschoolshop.entity.CommentExample;

import java.util.List;

public interface CommentService {
    public void insertSelective(Comment comment);

    public List<Comment> selectByExample(CommentExample commentExample);
}
