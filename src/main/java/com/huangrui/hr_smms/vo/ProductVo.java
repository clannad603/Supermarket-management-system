package com.huangrui.hr_smms.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class ProductVo implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String productId;
    private String productName;
    String brandName;
    List<String> types;
    BigDecimal price;
    String imgUrl;
}
