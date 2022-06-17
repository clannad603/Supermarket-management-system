package com.huangrui.hr_smms.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class AdminVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String username;
    private String shopName;
    private String role;
}
