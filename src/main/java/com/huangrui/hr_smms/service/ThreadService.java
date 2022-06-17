package com.huangrui.hr_smms.service;

import com.huangrui.hr_smms.entity.Log;
import com.huangrui.hr_smms.mapper.LogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class ThreadService {

    @Autowired
    private RedisTemplate<String ,String > redisTemplate;
    //期望在线程池执行，不影响主线程
    @Async("taskExecutor")
    public void log(LogMapper logMapper, String module, String operator, String params) {
        Log log = new Log();
        log.setOperationTime(System.currentTimeMillis());
        log.setOperation(module+ "." + operator+"."+params);
        log.setOperator(Long.valueOf(redisTemplate.opsForValue().get("Id")));;
        logMapper.insert(log);
    }
}
