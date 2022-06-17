package com.huangrui.hr_smms.service.impl;

import com.huangrui.hr_smms.entity.Log;
import com.huangrui.hr_smms.mapper.LogMapper;
import com.huangrui.hr_smms.service.LogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huangrui.hr_smms.service.ThreadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author huangrui
 * @since 2022-06-15
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Autowired
    private ThreadService threadService;


    @Override
    public void log(String module, String operator, String params) {
        threadService.log(logMapper, module,operator,params);
    }
}
