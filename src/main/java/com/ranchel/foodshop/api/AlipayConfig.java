package com.ranchel.foodshop.api;

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016091500519085";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCnEjArfkT0aNl7zluZzttJN24JSYEGhNwO0OjPAOO3fFEKw2+mVxJLit7d7CzAQFgO5jrCfU2yNGeB/2fHj9+Nhsl/X5dZ77UPjQF3EE8snOgISC+lzythERpU/AAYLSN3NleVnkT1XcBWNGUYhX4YqxDMlhavR1eaK6Ogv6epEDuUKElQaTjyJRTK/jrO7xpifSOUmXJrDf0d0ACerx1E0FUMFuUD0n+rfv7ulo5EsizSCfjCUCd+BFGC2JNIsFS1Wz+Pt9kPfRzn4gHmqFk4pIEAe5l4dA1/UOS6QrEdgazLLR/Vm3LKVs+gNrzf+gyBeQF1NaKofirG0v75Y713AgMBAAECggEAaTXr/cfDtsK8itnWF5MLxxzP/6s5RJiwV+g5Y/qkbK0uAAA5NGBK1iW62bhcKimbCq7zu/zay+lycYwcl7DD0EVcaQkSsAFjXUqn7InpwieBe42x69H9+F+j3HbhvFfYqL8hAsirlnUWpXLTY1DVqsU3jA7MdE8SHLV0kst+0tiwAVwxASKb1cil1/wLxI1ibvEBaGkwLrz+gSX9qa5yACiZdQxzCxo6i1OSRxdpHhnzBIg6W38Czmh7UmpitJi5oE8rFOXEu8Ot+KETPzPRNpISTI1ZihEH6iltoLQQnq7sqgg9VNOPHIiMwdTrtA91I9IF1KGMCvB+dT+j7rmpgQKBgQDdtSS59/jH4bplouEMiiany9mu7sNCfu3yJYmPVVP82o4osUNPCIhbp0Hww5Y5Scg3fH86NJN/oqqvB1RMoXXe/cWhS4uDqZKJiSFDVHYAN3jDBKjvU6blWjF5dCJr0ftvTozNGUGUwVWcIEDpIQs0Ogw2Iw6nCaGaGmjTdtGTNwKBgQDA6aA325IsWI9InNKBajXawHMVUBPtXZzE8cJQz2f+UGBSXkz7eFakSG633nv18Tl8KeWWJ+bPCbij2Qb7mSUlMNo7eOYWh0RKNg/DkznYKvoG06LwXT6ImVT9FbIZUv7Y5pwSat07l83G/XcxCaCZpYWh/9MzyoB7BubthazHwQKBgBQQb6lw2o/kSsUl723+Fq960FF3hC5BZHFUmlVhaH9qnBDsseW2JPj+cwZB/RdkKP10g+MVnP+hDgdXB3cD6bHrj3YgaxjYQM23nk4El8U/P+uOQWefT2xUNEQEkZTmZPXWywFIttmqgX/mn1k5x1TLqA1CMPJG+dwDZdc1WpQTAoGAVK14HWytAfgxlL75i8LyNr4pBd7rkFJ6ANzZ3Zzc2f2v+hfYlL1i0qPUrbLkGLW09PJzC3EiWBi9SnZ2ITQ84NFLybUs0hC4Ahcu3jsetetPanW1XOqhC1a6voiqb4FFyjGXqmHsED93HPSfQBAoxaipOs3PiDlIIjiKXxJBIEECgYEAzR7e8ax3wZt+4dGeWHNkBW1dE79WftDFOIUbyqpzBGnIVSx5MxzpuBqv6B0587Ur5QVWTMLxsSe+Gc4URV+RnZVm0tNiFTIckBqsfvIoQoHo2N+OBGebQ3cIa4RPnMC/++tLvVGZ7aep04+rnXjaPKk7eUeOHyuyGmyZl16O0d4=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApxIwK35E9GjZe85bmc7bSTduCUmBBoTcDtDozwDjt3xRCsNvplcSS4re3ewswEBYDuY6wn1NsjRngf9nx4/fjYbJf1+XWe+1D40BdxBPLJzoCEgvpc8rYREaVPwAGC0jdzZXlZ5E9V3AVjRlGIV+GKsQzJYWr0dXmiujoL+nqRA7lChJUGk48iUUyv46zu8aYn0jlJlyaw39HdAAnq8dRNBVDBblA9J/q37+7paORLIs0gn4wlAnfgRRgtiTSLBUtVs/j7fZD30c5+IB5qhZOKSBAHuZeHQNf1DkukKxHYGsyy0f1ZtyylbPoDa83/oMgXkBdTWiqH4qxtL++WO9dwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://5905ef16.nat123.net:11506/foodshop/api/notify";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://5905ef16.nat123.net:11506/foodshop/buyer/myorderlist";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";


}

