package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Shop;
import com.baomidou.mybatisplus.extension.service.IService;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.vo.Result;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
public interface ShopService extends IService<Shop> {

    Result getAllShop(PageParam pageParam);

    Result updateShop(Shop shop);

    Result addShop(Shop shop);

    Result delete(Long id);
}
