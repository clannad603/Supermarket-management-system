package com.huangrui.hr_smms.controller;


import com.huangrui.hr_smms.common.aop.LogAnnotation;
import com.huangrui.hr_smms.entity.Admin;
import com.huangrui.hr_smms.entity.Product;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.ProductService;
import com.huangrui.hr_smms.vo.ProductVo;
import com.huangrui.hr_smms.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author huangrui
 * @since 2022-06-16
 */
@RestController
@RequestMapping("/product")
@Api(tags = "ProductController" )
public class ProductController {

    @Autowired
    private ProductService productService;

    @LogAnnotation(module = "产品", operator = "获取产品列表")
    @ApiOperation("获取产品列表")
    @PostMapping("/getProducts")
    public Result getProducts(@RequestBody PageParam pageParam){
        return productService.getProducts(pageParam);
    }


    @LogAnnotation(module = "产品", operator = "更新产品")
    @ApiOperation("更新产品")
    @PostMapping("updateProduct")
    Result updateProduct(@RequestBody ProductVo product) {
        return productService.updateProduct(product);
    }


    @ApiOperation("添加产品")
    @LogAnnotation(module = "产品", operator = "添加产品")
    @PostMapping("addProduct")
    Result addProduct(@RequestBody ProductVo productVo) {
        return productService.addProduct(productVo);
    }

}
