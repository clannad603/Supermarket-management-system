package com.huangrui.hr_smms.dos;

import lombok.Data;

import java.io.Serializable;

@Data
public class ProvinceSales implements Serializable {
    private static final long serialVersionUID = 1L;
    private String province;
    private String sales;
}
