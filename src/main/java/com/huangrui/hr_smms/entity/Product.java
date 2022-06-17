package com.huangrui.hr_smms.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 
 * </p>
 *
 * @author huangrui
 * @since 2022-06-16
 */
@Data
@TableName("hr_product")
@ApiModel(value = "Product对象", description = "")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    @TableField("product_name")
    private String productName;

    @TableField("packing_way_id")
    private Long packingWayId;

    @TableField("size")
    private Integer size;

    @TableField("brand_id")
    private Long brandId;

    @TableField("types_id")
    private Long typesId;

    @TableField("price")
    private BigDecimal price;

    @TableField("upc")
    private String upc;

    @TableField("deleted")
    @TableLogic
    private Integer deleted;


}




