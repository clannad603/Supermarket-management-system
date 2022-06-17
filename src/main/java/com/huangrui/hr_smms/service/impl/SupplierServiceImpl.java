package com.huangrui.hr_smms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.huangrui.hr_smms.entity.*;
import com.huangrui.hr_smms.mapper.*;
import com.huangrui.hr_smms.service.SupplierService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huangrui.hr_smms.vo.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
@Service
public class SupplierServiceImpl extends ServiceImpl<SupplierMapper, Supplier> implements SupplierService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private SupplierMapper supplierMapper;

    @Autowired
    private WarehouseMapper warehouseMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ShopMapper  shopMapper;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Override
    public Result getSupplierList() {
        String id = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(id));
        Long shopId = admin.getShopId();
        Shop shop = shopMapper.selectById(shopId);
        Long shopSupplier = shop.getShopSupplier();
        Supplier supplier = supplierMapper.selectById(shopSupplier);
        List<SupplierVo> supplierVos = new ArrayList<>();
        supplierVos.add(copy(supplier));
        PageResult<SupplierVo> pageResult = new PageResult<>();
        pageResult.setList(supplierVos);
        return Result.success(pageResult);
    }

    @Override
    public Result addTrade(Trade trade) {
        String id = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(id));
        Long shopId = admin.getShopId();
        String productName = trade.getProductName();
        LambdaQueryWrapper<Product> wrapper = new LambdaQueryWrapper<Product>();
        wrapper.eq(Product::getProductName, productName);
        Product product = productMapper.selectOne(wrapper);
        Long productId = product.getId();
       Warehouse warehouse =  warehouseMapper.selectByProductId(productId,shopId,System.currentTimeMillis());
       if (warehouse == null){
           return Result.fail(ErrorCode.WAREHOUSE_NOT_EXIST.getCode(), ErrorCode.WAREHOUSE_NOT_EXIST.getMsg());
       }
       warehouse.setInventory(warehouse.getInventory()+trade.getCarriedOut());
       warehouseMapper.updateById(warehouse);
       return Result.success(null);
    }

    SupplierVo copy(Supplier supplier) {
        SupplierVo supplierVo = new SupplierVo();
        BeanUtils.copyProperties(supplier, supplierVo);
        supplierVo.setId(supplier.getId());
        return supplierVo;
    }

}
