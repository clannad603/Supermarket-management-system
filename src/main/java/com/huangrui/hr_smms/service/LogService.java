package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Log;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
public interface LogService extends IService<Log> {

    void log(String module, String operator, String params);
}
