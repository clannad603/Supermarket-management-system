package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.vo.Result;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-17
 */
public interface OrderService extends IService<Order> {

    Result getHandledOrder(PageParam pageParam);

    Result getUnhandledOrder(PageParam pageParam);

    Result handleOrder(Long id);

    Result deleteOrder(Long id);

    Result fallbackOrder(Long id);
}
