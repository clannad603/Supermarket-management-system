package com.huangrui.hr_smms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.entity.Admin;
import com.huangrui.hr_smms.entity.Shop;
import com.huangrui.hr_smms.entity.Supplier;
import com.huangrui.hr_smms.mapper.ShopMapper;
import com.huangrui.hr_smms.mapper.SupplierMapper;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.ShopService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huangrui.hr_smms.vo.AdminVo;
import com.huangrui.hr_smms.vo.PageResult;
import com.huangrui.hr_smms.vo.Result;
import com.huangrui.hr_smms.vo.ShopVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ShopServiceImpl extends ServiceImpl<ShopMapper, Shop> implements ShopService {

    @Autowired
    private ShopMapper shopMapper;

    @Autowired
    private SupplierMapper supplierMapper;

    @Override
    public Result getAllShop(PageParam pageParam) {
        Page<Shop> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        LambdaQueryWrapper<Shop> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(pageParam.getQueryString())) {
            wrapper.like(Shop::getShopName, pageParam.getQueryString());
        }
        Page<Shop> shopPage = shopMapper.selectPage(page, wrapper);
        PageResult<ShopVo> pageResult = new PageResult<>();
        pageResult.setList(copyList(shopPage.getRecords()));
        pageResult.setTotal(shopPage.getTotal());
        return Result.success(pageResult);
    }

    @Override
    public Result updateShop(Shop shop) {
        shopMapper.updateById(shop);
        return Result.success(null);
    }

    @Override
    public Result addShop(Shop shop) {
        shopMapper.insert(shop);
        return Result.success(null);
    }

    @Override
    public Result delete(Long id) {
        shopMapper.deleteById(id);
        return Result.success(null);
    }


    public ShopVo copy(Shop shop) {
        ShopVo shopVo = new ShopVo();
        shopVo.setId(shop.getId());
        shopVo.setName(shop.getShopName());
        shopVo.setAddress(shop.getShopAddressProvince()+shop.getShopAddress());
        Supplier supplier = supplierMapper.selectById(shop.getShopSupplier());
        shopVo.setSupplier(supplier.getSupplierName());
        shopVo.setBusinessTime(shop.getBussinessHoursStart()+":00--"+shop.getBussinessHoursStop()+":00");
        return shopVo;
    }

    public List<ShopVo> copyList(List<Shop> shopList) {
        List<ShopVo> shopVoList = new ArrayList<>();
        for (Shop shop : shopList) {
            shopVoList.add(copy(shop));
        }
        return shopVoList;
    }
}
