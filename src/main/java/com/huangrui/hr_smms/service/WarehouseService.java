package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Warehouse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.vo.Result;
import com.huangrui.hr_smms.vo.WareHouseVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
public interface WarehouseService extends IService<Warehouse> {

    Result getSalesRank(PageParam pageParam);

    Result getProvinceSalesRank(PageParam pageParam);

    Result getWareHouseByShopId(PageParam pageParam);

    Result addWarehouseByShopId(WareHouseVo wareHouseVo);
}
