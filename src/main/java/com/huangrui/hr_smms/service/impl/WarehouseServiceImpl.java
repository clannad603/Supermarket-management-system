package com.huangrui.hr_smms.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.dos.GoodsSales;
import com.huangrui.hr_smms.dos.ProvinceSales;
import com.huangrui.hr_smms.entity.*;
import com.huangrui.hr_smms.mapper.*;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.AdminService;
import com.huangrui.hr_smms.service.WarehouseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huangrui.hr_smms.vo.ErrorCode;
import com.huangrui.hr_smms.vo.PageResult;
import com.huangrui.hr_smms.vo.Result;
import com.huangrui.hr_smms.vo.WareHouseVo;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
@Service
public class WarehouseServiceImpl extends ServiceImpl<WarehouseMapper, Warehouse> implements WarehouseService {

    @Autowired
    private WarehouseMapper warehouseMapper;

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private BrandMapper brandMapper;

    @Autowired
    private TypesMapper typesMapper;

    @Autowired
    private TypeMapper typeMapper;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    public Result getSalesRank(PageParam pageParam) {
        Page<GoodsSales> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        IPage<GoodsSales> goodsSalesIPage = warehouseMapper.getGoodsSales(page, pageParam.getValueMonth());
        PageResult<GoodsSales> pageResult = new PageResult<>();
        pageResult.setList(goodsSalesIPage.getRecords());
        pageResult.setTotal(goodsSalesIPage.getTotal());
        return Result.success(pageResult);
    }

    @Override
    public Result getProvinceSalesRank(PageParam pageParam) {
        Page<ProvinceSales> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        IPage<ProvinceSales> provinceSalesIPage = warehouseMapper.getProvinceSales(page, pageParam.getValueMonth());
        PageResult<ProvinceSales> pageResult = new PageResult<>();
        pageResult.setList(provinceSalesIPage.getRecords());
        pageResult.setTotal(provinceSalesIPage.getTotal());
        return Result.success(pageResult);
    }

    @Override
    public Result getWareHouseByShopId(PageParam pageParam) {
        Page<Warehouse> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        String id = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(id));
        Long shopId = admin.getShopId();
        IPage<Warehouse> warehouseIPage = warehouseMapper.getWareHouseByShopId(page, shopId, pageParam.getValueMonth());
        PageResult<WareHouseVo> pageResult = new PageResult<>();
        if (StringUtils.isNotBlank(pageParam.getQueryString())) {
            LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<>();
            productLambdaQueryWrapper.eq(Product::getProductName, pageParam.getQueryString());
            Product product = productMapper.selectOne(productLambdaQueryWrapper);
            Long id1 = product.getId();
            List<WareHouseVo> wareHouseVos = new ArrayList<>();
            warehouseIPage.getRecords().forEach(warehouse -> {
                if (Objects.equals(warehouse.getProductId(), id1)) {
                    wareHouseVos.add(copy(warehouse));
                }
            });
            pageResult.setList(wareHouseVos);
            pageResult.setTotal(1L);
        } else {
            pageResult.setList(copyList(warehouseIPage.getRecords()));
            pageResult.setTotal(warehouseIPage.getTotal());
        }
        return Result.success(pageResult);
    }

    @Override
    public Result addWarehouseByShopId(WareHouseVo wareHouseVo) {
        LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<>();
        productLambdaQueryWrapper.eq(Product::getProductName, wareHouseVo.getProductName());
        Product product = productMapper.selectOne(productLambdaQueryWrapper);
        String id = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(id));
        Long shopId = admin.getShopId();
        List<Long> productIds = warehouseMapper.getProductIdLongs(shopId, System.currentTimeMillis());
        for (Long productId : productIds) {
            if (Objects.equals(productId, product.getId())) {
                return Result.fail(ErrorCode.PRODUCT_EXIST.getCode(), ErrorCode.PRODUCT_EXIST.getMsg());
            }
        }
        Warehouse warehouse = new Warehouse();
        warehouse.setProductId(product.getId());
        warehouse.setStatisticalTime(System.currentTimeMillis());
        warehouse.setSales(wareHouseVo.getSales());
        warehouse.setShopId(shopId);
        warehouse.setInventory(wareHouseVo.getInventory());
        warehouseMapper.insert(warehouse);

        return Result.success(null);
    }

    public WareHouseVo copy(Warehouse warehouse) {
        WareHouseVo wareHouseVo = new WareHouseVo();
        wareHouseVo.setProductId(String.valueOf(warehouse.getProductId()));
        Product product = productMapper.selectById(warehouse.getProductId());
        wareHouseVo.setProductName(product.getProductName());
        List<String> typeNames = new ArrayList<>();
        LambdaQueryWrapper<Types> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Types::getProductTypeId, product.getTypesId());
        List<Types> types = typesMapper.selectList(wrapper);
        for (Types type : types) {
            Long typeId = type.getTypeId();
            Type type1 = typeMapper.selectById(typeId);
            typeNames.add(type1.getTypeName());
        }
        Brand brand = brandMapper.selectById(product.getBrandId());
        wareHouseVo.setId(String.valueOf(warehouse.getId()));
        wareHouseVo.setBrandName(brand.getBrandName());
        wareHouseVo.setTypes(typeNames);
        wareHouseVo.setInventory(warehouse.getInventory());
        wareHouseVo.setSales(warehouse.getSales());
        return wareHouseVo;
    }

    public List<WareHouseVo> copyList(List<Warehouse> warehouses) {
        List<WareHouseVo> wareHouseVos = new ArrayList<>();
        for (Warehouse warehouse : warehouses) {
            WareHouseVo wareHouseVo = copy(warehouse);
            wareHouseVos.add(wareHouseVo);
        }
        return wareHouseVos;
    }
}
