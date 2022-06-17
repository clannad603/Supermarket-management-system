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
 * @since 2022-06-17
 */
@Data
@TableName("hr_order")
@ApiModel(value = "Order对象", description = "")
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("shop_id")
    private Long shopId;

    @TableField("user_id")
    private Long userId;

    @TableField("product_id")
    private Long productId;

    @TableField("create_date")
    private Long createDate;

    @TableField("is_payed")
    private Integer isPayed;

    @TableField("is_handled")
    private Integer isHandled;

    @TableField("quantity")
    private Integer quantity;

    @TableField("deleted")
    @TableLogic
    private Integer deleted;


}




