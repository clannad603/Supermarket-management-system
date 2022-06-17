package com.huangrui.hr_smms.controller;


import com.huangrui.hr_smms.common.aop.LogAnnotation;
import com.huangrui.hr_smms.service.SupplierService;
import com.huangrui.hr_smms.vo.Result;
import com.huangrui.hr_smms.vo.Trade;
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
@RequestMapping("/supplier")
@Api(tags = "SupplierController" )
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    @ApiOperation("获取供应商列表")
    @GetMapping("getSupplierList")
    Result getSupplierList() {
        return supplierService.getSupplierList();
    }

    @LogAnnotation(module = "供应商", operator = "进行交易")
    @ApiOperation("进行交易")
    @PostMapping("addTrade")
    Result addTrade(@RequestBody Trade trade) {
        return supplierService.addTrade(trade);
    }
}
