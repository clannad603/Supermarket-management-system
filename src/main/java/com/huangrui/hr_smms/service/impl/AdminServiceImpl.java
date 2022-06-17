package com.huangrui.hr_smms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.entity.Admin;
import com.huangrui.hr_smms.entity.Role;
import com.huangrui.hr_smms.entity.Shop;
import com.huangrui.hr_smms.mapper.AdminMapper;
import com.huangrui.hr_smms.mapper.RoleMapper;
import com.huangrui.hr_smms.mapper.ShopMapper;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huangrui.hr_smms.vo.AdminVo;
import com.huangrui.hr_smms.vo.PageResult;
import com.huangrui.hr_smms.vo.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-13
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private ShopMapper shopMapper;



    @Override
    public Result updateAdmin(Admin admin) {
        String pass = new BCryptPasswordEncoder().encode(admin.getPassword());
        admin.setPassword(pass);
        adminMapper.updateById(admin);
        return Result.success(null);
    }

    @Override
    public Result addAdmin(Admin admin) {
        adminMapper.insert(admin);
        return Result.success(null);
    }

    @Override
    public Result delete(Long id) {
        adminMapper.deleteById(id);
        return Result.success(null);
    }

    @Override
    public Result getAllAdmin(PageParam pageParam) {
        Page<Admin> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        LambdaQueryWrapper<Admin> wrapper = new LambdaQueryWrapper<>();
        wrapper.ne(Admin::getId, 1);
        if (StringUtils.isNotBlank(pageParam.getQueryString())) {
          wrapper.like(Admin::getName, pageParam.getQueryString());
        }
        Page<Admin> adminPage = adminMapper.selectPage(page, wrapper);
        PageResult<AdminVo> pageResult = new PageResult<>();
        pageResult.setList(copyList(adminPage.getRecords()));
        pageResult.setTotal(adminPage.getTotal());
        return Result.success(pageResult);
    }

    @Override
    public Admin findAdminByUserName(String username) {
        LambdaQueryWrapper<Admin> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Admin::getName, username);
        wrapper.last("limit 1");
        return adminMapper.selectOne(wrapper);
    }
    public AdminVo copy(Admin admin) {
        AdminVo adminVo = new AdminVo();
        adminVo.setId(String.valueOf(admin.getId()));
        adminVo.setUsername(admin.getName());
        Role role = roleMapper.selectById(admin.getRoleId());
        adminVo.setRole(role.getRoleName());
        Shop shop = shopMapper.selectById(admin.getShopId());
        adminVo.setShopName(shop.getShopName());
        return adminVo;
    }

    public List<AdminVo> copyList(List<Admin> adminList) {
        List<AdminVo> adminVoList = new ArrayList<>();
        for (Admin admin : adminList) {
            adminVoList.add(copy(admin));
        }
        return adminVoList;
    }
}
