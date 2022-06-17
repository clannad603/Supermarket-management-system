package com.huangrui.hr_smms.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrderVo implements Serializable {
    private final static long serialVersionUID = 1L;
    private String id;
    private Long userId;
    private String productName;
    private String date;
    private Integer quantity;
}
