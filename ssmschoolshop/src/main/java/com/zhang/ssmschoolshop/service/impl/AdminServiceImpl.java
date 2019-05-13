package com.zhang.ssmschoolshop.service.impl;


import com.zhang.ssmschoolshop.dao.AdminMapper;
import com.zhang.ssmschoolshop.entity.Admin;
import com.zhang.ssmschoolshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired(required = false)
    private AdminMapper adminMapper;

    @Override
    public Admin selectByName(Admin admin) {
        return adminMapper.selectByName(admin);
    }
}
