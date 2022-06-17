package com.huangrui.hr_smms.handle;

import com.huangrui.hr_smms.vo.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class AllExceptionHandler {
//    进行异常处理
    @ExceptionHandler(Exception.class)
    @ResponseBody //返回json数据
    public Result doException(Exception e){
        e.printStackTrace();
        return Result.fail(-999,"系统异常");
    }
}
