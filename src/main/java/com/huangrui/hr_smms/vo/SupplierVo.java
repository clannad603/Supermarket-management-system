package com.huangrui.hr_smms.vo;


import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
@Data
public class SupplierVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String supplierName;


    private String address;


    private String email;


    private Long phone;



}




