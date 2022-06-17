package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Admin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class AuthService {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RedisTemplate<String,String > redisTemplate;
    public boolean auth(HttpServletRequest request, Authentication authentication) {
        //权限认证
        String requestURI = request.getRequestURI();
        Object principal = authentication.getPrincipal();
        if (principal == null || "anonymousUser".equals(principal)) {//匿名用户
            //未登录
            return false;
        }
        UserDetails userDetails = (UserDetails) principal;
        String username = userDetails.getUsername();
        Admin admin = adminService.findAdminByUserName(username);
        if (admin==null){
            return false;
        }
        String redis_key = "Id";
        redisTemplate.opsForValue().set(redis_key,admin.getId().toString());
        if (admin.getRoleId()==1){
            //超级管理
            return true;
        }
        return false;
    }
}
