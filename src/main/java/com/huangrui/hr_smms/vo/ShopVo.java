package com.huangrui.hr_smms.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class ShopVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String name;
    private String address;
    private String supplier;
    private String businessTime;
}
