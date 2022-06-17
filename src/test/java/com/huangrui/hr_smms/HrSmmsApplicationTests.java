package com.huangrui.hr_smms;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huangrui.hr_smms.dos.GoodsSales;
import com.huangrui.hr_smms.dos.ProvinceSales;
import com.huangrui.hr_smms.entity.Order;
import com.huangrui.hr_smms.entity.Warehouse;
import com.huangrui.hr_smms.mapper.OrderMapper;
import com.huangrui.hr_smms.mapper.WarehouseMapper;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.service.AdminService;
import com.huangrui.hr_smms.service.OrderService;
import com.huangrui.hr_smms.service.ProductService;
import com.huangrui.hr_smms.service.WarehouseService;
import com.huangrui.hr_smms.vo.AdminVo;
import com.huangrui.hr_smms.vo.Result;
import com.huangrui.hr_smms.vo.WareHouseVo;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@SpringBootTest
class HrSmmsApplicationTests {

    @Autowired
    private WarehouseMapper warehouseMapper;


    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private WarehouseService warehouseService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AdminService adminService;


    @Test
    void contextLoads() {

        Long[] a = new Long[3];
        a[0] = 1655294400000L;
        a[1] = 1650024000000L;
        a[2] = 1652616000000L;
        for (int i = 1; i < 22; i++) {
            if (i == 7 || i ==11 || i== 13){
                continue;
            }
            Warehouse warehouse = new Warehouse();
            warehouse.setProductId((long) i);
            warehouse.setShopId((long) 5);
            warehouse.setInventory(getRandom(200,100));
            warehouse.setSales((long)getRandom(100,50));
            warehouse.setStatisticalTime(a[2]);
            warehouseMapper.insert(warehouse);
        }
    }

    @Test
    void getTime(){
        String format1 = DateFormatUtils.format(1655294400000L, "yyyy-MM-dd HH:mm:ss");
        System.out.println(format1);
    }

    @Test
    void getLongTime(){
//        long time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).parse("2022-06-15 20:00:00", new ParsePosition(0)).getTime();
//        long time1 = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).parse("2022-04-15 20:00:00", new ParsePosition(0)).getTime();
        long time2 = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).parse("2022-05-15 20:00:00", new ParsePosition(0)).getTime();
        long time3 = (new SimpleDateFormat("yyyy-MM")).parse("2022-05", new ParsePosition(0)).getTime();
//        System.out.println(time);
        System.out.println(time2);
        System.out.println(time3);
    }


    int getRandom(int max, int min){
        Random random = new Random();
        int i = random.nextInt(max) % (max - min + 1) + min;
        return  i;
    }


    @Test
    void getAdmins(){
        PageParam pageParam = new PageParam();
        pageParam.setCurrentPage(1);
        pageParam.setPageSize(10);
        pageParam.setQueryString("shop_");
        Result allAdmin = adminService.getAllAdmin(pageParam);
        System.out.println(allAdmin);
    }


    @Test
    void getSalesRank(){
        Page<GoodsSales> page = new Page<>(1, 10);
        IPage<GoodsSales> goodsSales = warehouseMapper.getGoodsSales(page, 1651334400L);
        List<GoodsSales> records = goodsSales.getRecords();
        for (GoodsSales goodsSale : records) {
            System.out.println(goodsSale);
        }
    }

    @Test
    void getProvinceRank(){
        Page<ProvinceSales> page = new Page<>(1, 10);
        IPage<ProvinceSales> goodsSales = warehouseMapper.getProvinceSales(page, 1652616000000L);
        List<ProvinceSales> records = goodsSales.getRecords();
        for (ProvinceSales goodsSale : records) {
            System.out.println(goodsSale);
        }
    }

    @Test
    void showDate(){
        String format = DateFormatUtils.format(1652616000000L, "yyyy-MM");
        System.out.println(format);
    }

    @Test
    void getWreHouseByShopId(){
        PageParam pageParam = new PageParam();
        pageParam.setCurrentPage(1);
        pageParam.setPageSize(10);
        pageParam.setValueMonth(1652616000000L);
        Result wareHouse = warehouseService.getWareHouseByShopId(pageParam);
        System.out.println(wareHouse.getData());
    }

    @Test
    void testProduct(){
        PageParam pageParam = new PageParam();
        pageParam.setCurrentPage(1);
        pageParam.setPageSize(10);
        Result products = productService.getProducts(pageParam);
        System.out.println(products.getData());
    }


    @Test
    void seraial(){
        List<String > list = new ArrayList<>();
        list.add("1");
        list.add("2");
        String s = JSON.toJSONString(list);
        System.out.println(
                s
        );
        List<String > o = JSON.parseObject(s, new TypeReference<List<String>>() {
        });
        System.out.println(o.get(0));
    }

    @Test
    void addOrder(){

        for (int i = 1; i <=6 ; i++) {
            int max = getRandom(20,5);
            for (int j = 0; j < max/2; j++) {
                int product_id = getRandom(21,1);
                Order order = new Order();
                order.setUserId(1L);
                order.setProductId((long) product_id);
                order.setShopId((long) i);
                order.setCreateDate(System.currentTimeMillis());
                order.setIsPayed(1);
                order.setIsHandled(0);
                order.setQuantity(getRandom(5,1));
                orderMapper.insert(order);
            }
            for (int j = 0; j < max/2; j++) {
                int product_id = getRandom(21,1);
                Order order = new Order();
                order.setUserId(2L);
                order.setProductId((long) product_id);
                order.setShopId((long) i);
                order.setCreateDate(System.currentTimeMillis());
                order.setIsPayed(1);
                order.setIsHandled(0);
                order.setQuantity(getRandom(5,1));
                orderMapper.insert(order);
            }
        }
    }

    @Test
    void getOrder(){
        PageParam pageParam = new PageParam();
        pageParam.setCurrentPage(1);
        pageParam.setPageSize(10);
        Result orders = orderService.getHandledOrder(pageParam);
        System.out.println(orders.getData());
    }

}
