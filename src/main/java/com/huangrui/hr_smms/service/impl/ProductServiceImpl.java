package com.huangrui.hr_smms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.entity.*;
import com.huangrui.hr_smms.mapper.BrandMapper;
import com.huangrui.hr_smms.mapper.ProductMapper;
import com.huangrui.hr_smms.mapper.TypeMapper;
import com.huangrui.hr_smms.mapper.TypesMapper;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.ProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huangrui.hr_smms.utils.BarcodeUtils;
import com.huangrui.hr_smms.utils.QiniuUtils;
import com.huangrui.hr_smms.vo.PageResult;
import com.huangrui.hr_smms.vo.ProductVo;
import com.huangrui.hr_smms.vo.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-16
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private BrandMapper brandMapper;

    @Autowired
    private TypesMapper typesMapper;

    @Autowired
    private TypeMapper typeMapper;

    @Autowired
    private QiniuUtils qiniuUtils;
    @Override
    public Result getProducts(PageParam pageParam) {
        Page<Product> productPage = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        LambdaQueryWrapper<Product> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(pageParam.getQueryString())) {
            wrapper.like(Product::getProductName, pageParam.getQueryString());
        }
        Page<Product> page = productMapper.selectPage(productPage, wrapper);
        PageResult<ProductVo> pageResult = new PageResult<>();
        pageResult.setList(copyList(page.getRecords()));
        pageResult.setTotal(page.getTotal());
        return Result.success(pageResult);
    }

    @Override
    public Result updateProduct(ProductVo productVo) {
        List<String> types = productVo.getTypes();
        if (types.size()>0){
            LambdaQueryWrapper<Types> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(Types::getProductTypeId, productVo.getProductId());
            typesMapper.delete(wrapper);
            for (String type : types) {
                LambdaQueryWrapper<Type> wrapper1 = new LambdaQueryWrapper<>();
                wrapper1.eq(Type::getTypeName, type);
                Type type1 = typeMapper.selectOne(wrapper1);
                Types types1 = new Types();
                types1.setProductTypeId(Long.valueOf(productVo.getProductId()));
                types1.setTypeId(type1.getId());
                typesMapper.insert(types1);
            }
        }

        LambdaUpdateWrapper<Product> wrapper1 = new LambdaUpdateWrapper<>();
        wrapper1.eq(Product::getId, productVo.getProductId());
        if (StringUtils.isNotBlank(productVo.getProductName())) {
            wrapper1.set(Product::getProductName, productVo.getProductName());
        }
        if (StringUtils.isNotBlank(productVo.getBrandName())) {
            LambdaQueryWrapper<Brand> brandWrapper = new LambdaQueryWrapper<>();
            brandWrapper.eq(Brand::getBrandName, productVo.getBrandName());
            Brand brand = brandMapper.selectOne(brandWrapper);
            wrapper1.set(Product::getBrandId, brand.getId());
        }
        if (productVo.getPrice() != null) {
            wrapper1.set(Product::getPrice, productVo.getPrice());
        }
        productMapper.update(null, wrapper1);
        return Result.success(null);
    }

//    private String productName;
//    String brandName;
//    List<String > types;
//    BigDecimal price;

    @Override
    public Result addProduct(ProductVo productVo) {
        Product product = new Product();
        product.setProductName(productVo.getProductName());
        LambdaQueryWrapper<Brand> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Brand::getBrandName, productVo.getBrandName());
        Brand brand = brandMapper.selectOne(wrapper);
        product.setBrandId(brand.getId());
        product.setPrice(productVo.getPrice());
        productMapper.insert(product);
        List<String> types = productVo.getTypes();
        product.setSize(1);
        for (String type : types) {
            LambdaQueryWrapper<Type> wrapper1 = new LambdaQueryWrapper<>();
            wrapper1.eq(Type::getTypeName, type);
            Type type1 = typeMapper.selectOne(wrapper1);
            Types types1 = new Types();
            types1.setProductTypeId(product.getId());
            types1.setTypeId(type1.getId());
            typesMapper.insert(types1);
        }
        product.setTypesId(product.getId());
        File file = BarcodeUtils.generateFile(String.valueOf(product.getId()), product.getId() + ".png");
        String fileName = product.getId() + ".png";
        qiniuUtils.upload(file.getPath(), fileName);
        product.setUpc(QiniuUtils.url+ fileName);
        productMapper.updateById(product);

        return Result.success(null);
    }


    public ProductVo copy(Product product){
        ProductVo productVo = new ProductVo();
        productVo.setProductId(String.valueOf(product.getId()));
        productVo.setPrice(product.getPrice());
        productVo.setProductName(product.getProductName());
        Brand brand = brandMapper.selectById(product.getBrandId());
        productVo.setBrandName(brand.getBrandName());
        List<String > typeNames = new ArrayList<>();
        LambdaQueryWrapper<Types> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Types::getProductTypeId,product.getTypesId());
        List<Types> types = typesMapper.selectList(wrapper);
        for (Types type : types) {
            Long typeId = type.getTypeId();
            Type type1 = typeMapper.selectById(typeId);
            typeNames.add(type1.getTypeName());
        }
        productVo.setTypes(typeNames);
        if (product.getId()<=21){
            productVo.setImgUrl(".."+product.getUpc());
        }else{
            productVo.setImgUrl(product.getUpc());
        }
        return  productVo;
    }

    public List<ProductVo> copyList(List<Product> products){
        List<ProductVo> productVos = new ArrayList<>();
        for (Product product:products){
            productVos.add(copy(product));
        }
        return productVos;
    }
}
