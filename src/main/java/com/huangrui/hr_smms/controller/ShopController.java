package com.huangrui.hr_smms.controller;


import com.huangrui.hr_smms.common.aop.LogAnnotation;
import com.huangrui.hr_smms.entity.Admin;
import com.huangrui.hr_smms.entity.Shop;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.AdminService;
import com.huangrui.hr_smms.service.ShopService;
import com.huangrui.hr_smms.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
@RestController
@Api(tags = "ShopController" )
@RequestMapping("/shop")
public class ShopController {

    @Autowired
    private ShopService shopService;

    @LogAnnotation(module = "店铺", operator = "获取店铺列表")
    @ApiOperation("获取店铺列表")
    @PostMapping("getAllShop")
    Result getAllShop(@RequestBody PageParam pageParam) {
        return shopService.getAllShop(pageParam);
    }


    @LogAnnotation(module = "店铺", operator = "更新店铺")
    @ApiOperation("更新店铺")
    @PostMapping("updateShop")
    Result updateShop(@RequestBody Shop shop) {
        return shopService.updateShop(shop);
    }

    @LogAnnotation(module = "店铺", operator = "添加店铺")
    @ApiOperation("添加店铺")
    @PostMapping("addShop")
    Result addShop(@RequestBody Shop shop) {
        return shopService.addShop(shop);
    }

    @LogAnnotation(module = "店铺", operator = "删除店铺")
    @ApiOperation("删除店铺")
    @GetMapping("deleteShop/{id}")
    public Result delete(@PathVariable("id") Long id){
        return shopService.delete(id);
    }

}
