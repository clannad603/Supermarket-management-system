package com.huangrui.hr_smms.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * <p>
 * 
 * </p>
 *
 * @author huangrui
 * @since 2022-06-13
 */
@Data
@TableName("hr_admin")
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("name")
    private String name;

    @TableField("password")
    private String password;

    @TableField("shop_id")
    private Long shopId;

    @TableField("role_id")
    private Long roleId;

    @TableField("deleted")
    @TableLogic
    private Integer deleted;


}




