package com.huangrui.hr_smms.dos;

import lombok.Data;

import java.io.Serializable;

@Data
public class GoodsSales implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String goodsName;
    private Integer goodsSales;
}
