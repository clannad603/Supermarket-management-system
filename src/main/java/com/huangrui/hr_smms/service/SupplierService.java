package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Supplier;
import com.baomidou.mybatisplus.extension.service.IService;
import com.huangrui.hr_smms.vo.Result;
import com.huangrui.hr_smms.vo.Trade;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
public interface SupplierService extends IService<Supplier> {

    Result getSupplierList();

    Result addTrade(Trade trade);
}
