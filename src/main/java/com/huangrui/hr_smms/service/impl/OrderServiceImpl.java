package com.huangrui.hr_smms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.entity.*;
import com.huangrui.hr_smms.mapper.*;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huangrui.hr_smms.vo.ErrorCode;
import com.huangrui.hr_smms.vo.OrderVo;
import com.huangrui.hr_smms.vo.PageResult;
import com.huangrui.hr_smms.vo.Result;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-17
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;


    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private WarehouseMapper warehouseMapper;

    @Override
    public Result getHandledOrder(PageParam pageParam) {
        Page<Order> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        String id = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(id));
        Long shopId = admin.getShopId();
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(pageParam.getQueryString())) {
            wrapper.eq(Order::getUserId, pageParam.getQueryString());
        }
        wrapper.eq(Order::getShopId, shopId);
        wrapper.eq(Order::getIsHandled, 1);
        Page<Order> orderPage = orderMapper.selectPage(page, wrapper);
        PageResult<OrderVo> pageResult = new PageResult<>();
        pageResult.setTotal(orderPage.getTotal());
        pageResult.setList(copyList(orderPage.getRecords()));
        return Result.success(pageResult);
    }

    @Override
    public Result getUnhandledOrder(PageParam pageParam) {
        Page<Order> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        String id = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(id));
        Long shopId = admin.getShopId();
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(pageParam.getQueryString())) {
            wrapper.eq(Order::getUserId, pageParam.getQueryString());
        }
        wrapper.eq(Order::getShopId, shopId);
        wrapper.eq(Order::getIsHandled, 0);
        Page<Order> orderPage = orderMapper.selectPage(page, wrapper);
        PageResult<OrderVo> pageResult = new PageResult<>();
        pageResult.setTotal(orderPage.getTotal());
        pageResult.setList(copyList(orderPage.getRecords()));
        return Result.success(pageResult);
    }

    @Override
    public Result handleOrder(Long id) {
        String adminId = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(adminId));
        Long shopId = admin.getShopId();
        Order order = orderMapper.selectById(id);
        Integer quantity = order.getQuantity();
        Long productId = order.getProductId();
        Warehouse warehouse = warehouseMapper.selectByProductId(productId, shopId, System.currentTimeMillis());
        Integer inventory = warehouse.getInventory();
        if (inventory < quantity) {
            return Result.fail(ErrorCode.PRODUCT_INVENTORY_NOT_ENOUGH.getCode(), ErrorCode.PRODUCT_INVENTORY_NOT_ENOUGH.getMsg());
        } else {
            warehouse.setInventory(inventory - quantity);
            warehouse.setSales(warehouse.getSales() + quantity);
            warehouseMapper.updateById(warehouse);
            order.setIsHandled(1);
            orderMapper.updateById(order);
            return Result.success(null);
        }
    }

    @Override
    public Result deleteOrder(Long id) {
        orderMapper.deleteById(id);
        return Result.success(null);
    }

    @Override
    public Result fallbackOrder(Long id) {
        String adminId = redisTemplate.opsForValue().get("Id");
        Admin admin = adminMapper.selectById(Long.parseLong(adminId));
        Long shopId = admin.getShopId();
        Order order = orderMapper.selectById(id);
        Integer quantity = order.getQuantity();
        Long productId = order.getProductId();
        Warehouse warehouse = warehouseMapper.selectByProductId(productId, shopId, System.currentTimeMillis());
        Integer inventory = warehouse.getInventory();
        if ((warehouse.getSales() - quantity)<0){
            return Result.fail(ErrorCode.SALES_ERROR.getCode(), ErrorCode.SALES_ERROR.getMsg());
        }else{
            warehouse.setInventory(inventory + quantity);
            warehouse.setSales(warehouse.getSales() - quantity);
            warehouseMapper.updateById(warehouse);
            order.setIsHandled(0);
            orderMapper.updateById(order);
            return Result.success(null);
        }

    }

    OrderVo copy(Order order) {
        OrderVo orderVo = new OrderVo();
        orderVo.setId(String.valueOf(order.getId()));
        orderVo.setUserId(order.getUserId());
        Product product = productMapper.selectById(order.getProductId());
        orderVo.setProductName(product.getProductName());
        orderVo.setQuantity(order.getQuantity());
        String formatTime = DateFormatUtils.format(order.getCreateDate(), "yyyy-MM-dd HH:mm:ss");
        orderVo.setDate(formatTime);
        return orderVo;
    }

    List<OrderVo> copyList(List<Order> orders) {
        List<OrderVo> orderVos = new ArrayList<>();
        for (Order order : orders) {
            orderVos.add(copy(order));
        }
        return orderVos;
    }
}
