package com.huangrui.hr_smms.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

@Configuration
@EnableAsync//开启多线程
public class ThreadPoolConfig {

    @Bean("taskExecutor")
    public Executor asyncServiceExecutor() {
        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
        //核心线程数
        taskExecutor.setCorePoolSize(5);
        //最大线程数
        taskExecutor.setMaxPoolSize(10);
        //队列容量
        taskExecutor.setQueueCapacity(25);
        //线程池维护线程所允许的空闲时间，线程活跃时间
        taskExecutor.setKeepAliveSeconds(60);
        taskExecutor.setThreadNamePrefix("task-");
        //等待所有任务结束后关闭线程池
        taskExecutor.setWaitForTasksToCompleteOnShutdown(true);
        taskExecutor.setAwaitTerminationSeconds(60);
        taskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        taskExecutor.initialize();
        return taskExecutor;
    }
}
