package com.huangrui.hr_smms.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
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
@TableName("hr_log")
@ApiModel(value = "Log对象", description = "")
public class Log implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("operation")
    private String operation;

    @TableField("operator")
    private Long operator;

    @TableField("operation_time")
    private Long operationTime;


}




