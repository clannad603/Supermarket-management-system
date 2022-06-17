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
@TableName("hr_warehouse")
@ApiModel(value = "Warehouse对象", description = "")
public class Warehouse implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("shop_id")
    private Long shopId;

    @TableField("product_id")
    private Long productId;

    @TableField("statistical_time")
    private Long statisticalTime;

    @TableField("inventory")
    private Integer inventory;

    @TableField("sales")
    private Long sales;

    @TableField("deleted")
    @TableLogic
    private Integer deleted;


}




