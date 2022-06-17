package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Admin;
import com.baomidou.mybatisplus.extension.service.IService;
import com.huangrui.hr_smms.params.PageParam;
import com.huangrui.hr_smms.vo.AdminVo;
import com.huangrui.hr_smms.vo.Result;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-13
 */
public interface AdminService extends IService<Admin> {

 

    Result updateAdmin(Admin admin);

    Result addAdmin(Admin admin);

    Result delete(Long id);

    Result getAllAdmin(PageParam pageParam);

    Admin findAdminByUserName(String username);
}
