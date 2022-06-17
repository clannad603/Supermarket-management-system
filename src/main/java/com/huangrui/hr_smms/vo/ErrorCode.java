package com.huangrui.hr_smms.vo;

public enum ErrorCode {

    PARAMS_ERROR(10001,"参数有误"),
    TOKEN_ERROR(10003,"token错误"),
    ACCOUNT_PWD_NOT_EXIST(10002,"用户名或密码不存在"),
    NO_PERMISSION(70001,"无访问权限"),
    SESSION_TIME_OUT(90001,"会话超时"),
    NO_LOGIN(90002,"未登录"),
    ACCOUNT_EXIST(10004,"账号已存在"),
    PRODUCT_EXIST(10005,"商品已存在"),
    PRODUCT_INVENTORY_NOT_ENOUGH(10006,"商品库存不足"),

    SALES_ERROR(20001,"销售异常"),
    WAREHOUSE_NOT_EXIST(10006,"商品无库存，请先添加仓库");
    private int code;
    private String msg;

    ErrorCode(int code, String msg){
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}