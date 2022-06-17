package com.huangrui.hr_smms.controller;


import com.huangrui.hr_smms.common.aop.LogAnnotation;

import com.huangrui.hr_smms.entity.Admin;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.AdminService;

import com.huangrui.hr_smms.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author huangrui
 * @since 2022-06-13
 */
@RestController
@Api(tags = "AdminController" )
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;


    @ApiOperation("获取管理员列表")
    @LogAnnotation(module = "管理员", operator = "获取管理员列表")
    @PostMapping("adminList")
    public Result getAllAdmin(@RequestBody PageParam pageParam) {
        return adminService.getAllAdmin(pageParam);
    }
    @LogAnnotation(module = "管理员", operator = "更新管理员")
    @ApiOperation("更新管理员")
    @PostMapping("updateAdmin")
    Result updateAdmin(@RequestBody Admin admin) {
        return adminService.updateAdmin(admin);
    }

    @LogAnnotation(module = "管理员", operator = "添加管理员")
    @ApiOperation("添加管理员")
    @PostMapping("addAdmin")
    Result addAdmin(@RequestBody Admin admin) {
        return adminService.addAdmin(admin);
    }

    @LogAnnotation(module = "管理员", operator = "删除管理员")
    @ApiOperation("删除管理员")
    @GetMapping("deleteAdmin/{id}")
    public Result delete(@PathVariable("id") Long id){
        return adminService.delete(id);
    }

}
