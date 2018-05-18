package com.ranchel.foodshop.enums;

import lombok.Getter;

@Getter
public enum ApiCodeEnum{
    USERNOTEXSIT(101, "用户不存在"),
    USEREXSIT(102, "用户存在"),

    USERNAMEISNULL(201,"用户提交数据为空"),

    USERREGISTERSUCESS(301,"用户注册成功"),
    USERREGISTERFAIL(302,"用户注册失败"),

    USERLOGINSUCCESS(401,"用户登录成功"),
    USERLOGINFAIL(402,"用户登录失败"),
    USERLOGINERROR(403,"登录系统错误"),

    USERLOGOUTSUCCESS(501,"用户登出成功"),
    USERLOGOUTFAIL(502,"用户登出失败"),
    USERLOGOUTERROR(503,"登出系统错误"),

    NOTLOGIN(601,"用户未登录"),


    ADDTOCARTSUCCESS(701,"添加购物车成功"),

    COUNTSUCCESS(801,"提价订单成功"),

    PAYSUCCESS(901,"支付成功"),
    PAYFAIL(902,"支付失败"),
    PAYERROR(903,"支付出错");

    private Integer code;
    private String message;

    ApiCodeEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

}