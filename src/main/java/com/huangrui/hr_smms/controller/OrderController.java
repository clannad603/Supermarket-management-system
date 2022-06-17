package com.huangrui.hr_smms.controller;


import com.huangrui.hr_smms.common.aop.LogAnnotation;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.OrderService;
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
 * @since 2022-06-17
 */
@RestController
@Api(tags = "OrderController" )
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @ApiOperation("获取已处理订单列表")
    @LogAnnotation(module = "订单", operator = "获取已处理订单列表")
    @PostMapping("/getHandledOrder")
    Result getHandledOrder(@RequestBody PageParam pageParam) {
        return orderService.getHandledOrder(pageParam);
    }

    @ApiOperation("获取未处理订单列表")
    @LogAnnotation(module = "订单", operator = "获取未处理订单列表")
    @PostMapping("/getUnhandledOrder")
    Result getUnhandledOrder(@RequestBody PageParam pageParam) {
        return orderService.getUnhandledOrder(pageParam);
    }

    @ApiOperation("处理订单")
    @LogAnnotation(module = "订单", operator = "处理订单")
    @GetMapping("/handleOrder/{id}")
    Result handleOrder(@PathVariable("id") Long id) {
        return orderService.handleOrder(id);
    }

    @ApiOperation("回退订单")
    @LogAnnotation(module = "订单", operator = "回退订单")
    @GetMapping("/fallbackOrder/{id}")
    Result fallbackOrder(@PathVariable("id") Long id) {
        return orderService.fallbackOrder(id);
    }

    @ApiOperation("删除订单")
    @LogAnnotation(module = "订单", operator = "删除订单")
    @GetMapping("/deleteOrder/{id}")
    Result deleteOrder(@PathVariable("id") Long id) {
        return orderService.deleteOrder(id);
    }
}
