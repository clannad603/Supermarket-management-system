package com.huangrui.hr_smms.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author huangrui
 * @since 2022-06-17
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

}
