package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.vo.ProductVo;
import com.huangrui.hr_smms.vo.Result;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-16
 */
@Transactional
public interface ProductService extends IService<Product> {

    Result getProducts(PageParam pageParam);


    Result updateProduct(ProductVo product);

    Result addProduct(ProductVo productVo);
}
