package com.zhang.ssmschoolshop.service.impl;


import com.zhang.ssmschoolshop.dao.CommentMapper;
import com.zhang.ssmschoolshop.entity.Comment;
import com.zhang.ssmschoolshop.entity.CommentExample;
import com.zhang.ssmschoolshop.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired(required = false)
    private CommentMapper commentMapper;

    @Override
    public void insertSelective(Comment comment){
        commentMapper.insertSelective(comment);
    }

    @Override
    public List<Comment> selectByExample(CommentExample commentExample) {
        return commentMapper.selectByExample(commentExample);
    }

}
