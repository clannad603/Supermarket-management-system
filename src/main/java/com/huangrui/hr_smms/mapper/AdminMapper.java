package com.huangrui.hr_smms.mapper;

import com.huangrui.hr_smms.entity.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author huangrui
 * @since 2022-06-13
 */
@Mapper
public interface AdminMapper extends BaseMapper<Admin> {

    @Select("select * from hr_admin where name = #{username}")
    Admin getPasswordById(String username);
}
