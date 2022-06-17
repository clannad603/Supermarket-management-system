package com.huangrui.hr_smms.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
@Data
@TableName("hr_shop")
@ApiModel(value = "Shop对象", description = "")
public class Shop implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("shop_name")
    private String shopName;

    @TableField("shop_address_province")
    private String shopAddressProvince;

    @TableField("shop_address")
    private String shopAddress;

    @TableField("bussiness_hours_start")
    private Long bussinessHoursStart;

    @TableField("shop_supplier")
    private Long shopSupplier;

    @TableField("bussiness_hours_stop")
    private Long bussinessHoursStop;

    @TableField("deleted")
    @TableLogic
    private Integer deleted;


}




