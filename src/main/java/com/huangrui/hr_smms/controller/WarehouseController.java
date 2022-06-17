package com.huangrui.hr_smms.controller;


import com.huangrui.hr_smms.common.aop.LogAnnotation;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.WarehouseService;
import com.huangrui.hr_smms.vo.Result;
import com.huangrui.hr_smms.vo.WareHouseVo;
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
 * @since 2022-06-15
 */
@RestController
@RequestMapping("/warehouse")
@Api(tags = "WarehouseController" )
public class WarehouseController {

    @Autowired
    private WarehouseService warehouseService;

    @LogAnnotation(module = "仓库", operator = "获取销售排行")
    @ApiOperation("获取销售排行")
    @PostMapping("/getSalesRank")
    @Cacheable(value = "getSalesRank")
    public Result getSalesRank(@RequestBody PageParam pageParam) {
        return warehouseService.getSalesRank(pageParam);
    }

    @LogAnnotation(module = "仓库", operator = "获取地区排行")
    @ApiOperation("获取地区排行")
    @PostMapping("/getProvinceSalesRank")
    @Cacheable(value = "getProvinceSalesRank")
    public  Result getProvinceSalesRank(@RequestBody PageParam pageParam) {
        return warehouseService.getProvinceSalesRank(pageParam);
    }

    @LogAnnotation(module = "仓库", operator = "获取仓库列表")
    @ApiOperation("获取仓库列表")
    @PostMapping("/getProductByShop")
    @Cacheable(value = "getProductByShop")
    public Result getWareHouseByShopId(@RequestBody PageParam pageParam) {
        return warehouseService.getWareHouseByShopId(pageParam);
    }

    @LogAnnotation(module = "仓库", operator = "新建仓库")
    @ApiOperation("新建仓库")
    @PostMapping("addWarehouseByShopId")
    public Result addWarehouseByShopId(@RequestBody WareHouseVo wareHouseVo) {
        return warehouseService.addWarehouseByShopId(wareHouseVo);
    }
}
