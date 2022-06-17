package com.huangrui.hr_smms.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Data
public class WareHouseVo implements Serializable {
    private static final long serialVersionUID = 1L;
    String id;
    String productId;
    String productName;
    String brandName;
    List<String > types;
    private Integer inventory;
    Long sales;
}
