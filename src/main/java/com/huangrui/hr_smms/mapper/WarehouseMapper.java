package com.huangrui.hr_smms.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.dos.GoodsSales;
import com.huangrui.hr_smms.dos.ProvinceSales;
import com.huangrui.hr_smms.entity.Warehouse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
@Mapper
public interface WarehouseMapper extends BaseMapper<Warehouse> {


    IPage<GoodsSales> getGoodsSales(Page<GoodsSales> page, Long valueMonth);

    IPage<ProvinceSales> getProvinceSales(Page<ProvinceSales> page, Long valueMonth);

    IPage<Warehouse> getWareHouseByShopId(Page<Warehouse> page, Long shopId, Long valueMonth);

    List<Long> getProductIdLongs(Long shopId, Long valueMonth);

    Warehouse selectByProductId(Long productId, Long shopId, long currentTimeMillis);
}
