package com.huangrui.hr_smms.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Trade implements Serializable {
    private final static long serialVersionUID = 1L;

    private String productName;

    private Integer carriedOut;

}
