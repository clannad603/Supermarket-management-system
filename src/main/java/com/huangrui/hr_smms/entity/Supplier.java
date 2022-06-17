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
@TableName("hr_supplier")
@ApiModel(value = "Supplier对象", description = "")
public class Supplier implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("supplier_name")
    private String supplierName;

    @TableField("address")
    private String address;

    @TableField("email")
    private String email;

    @TableField("phone")
    private Long phone;

    @TableField("deleted")
    @TableLogic
    private Integer deleted;


}




