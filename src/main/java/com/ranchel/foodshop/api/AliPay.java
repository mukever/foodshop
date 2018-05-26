package com.ranchel.foodshop.api;


import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeCloseRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.ranchel.foodshop.dateobject.ApiMessage;
import com.ranchel.foodshop.dto.OrderDto;
import com.ranchel.foodshop.service.CategoryService;
import com.ranchel.foodshop.service.FoodService;
import com.ranchel.foodshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

@RestController
@RequestMapping("/api")
public class AliPay {

    @Autowired
    private FoodService foodService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/notify")
    @ResponseBody
    public ApiMessage pay2aliweb(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("notify-------------");
        Enumeration enu=request.getParameterNames();
        while(enu.hasMoreElements()){
            String paraName=(String)enu.nextElement();
            System.out.println(paraName+": "+request.getParameter(paraName));
        }

        return new ApiMessage();
    }

    @RequestMapping("/return")
    public String paysuccessOrnot(
            @RequestParam(value ="total_amount",required = false) String total_amount,
            @RequestParam(value ="timestamp",required = false)String timestamp,
            @RequestParam(value ="trade_no",required = false)String trade_no,
            @RequestParam(value ="seller_id",required = false)String seller_id,
            @RequestParam(value ="out_trade_no",required = false)String out_trade_no,

            HttpServletRequest request, HttpServletResponse response) {
        System.out.println("return---------------");

        Enumeration enu=request.getParameterNames();
        while(enu.hasMoreElements()){
            String paraName=(String)enu.nextElement();
            System.out.println(paraName+": "+request.getParameter(paraName));
        }


        //数据库操作


        return "redirect:/buyer/myorder";
    }

    @RequestMapping("/closepay")
    @ResponseBody
    public String closePay(
            @RequestParam(value = "oid",required = true) String oid,
            HttpServletRequest request, HttpServletResponse response) {

        String result = "";
        //跨域设置
        Common.common(response);
        OrderDto order =orderService.findOne(oid);
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeCloseRequest alipayRequest = new AlipayTradeCloseRequest();
        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = oid;
        //支付宝交易号
        String trade_no = "";
        //请二选一设置

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," +"\"trade_no\":\""+ trade_no +"\"}");

        //请求
        try {
            result = alipayClient.execute(alipayRequest).getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }finally {
            return result;
        }

    }


    @RequestMapping("/pay")
    @ResponseBody
    public String testpostpay(
            @RequestParam(value = "oid",required = true) String oid,
            
            HttpServletRequest request, HttpServletResponse response) throws AlipayApiException {

        String result = "";
        //跨域设置
        Common.common(response);
        OrderDto order =orderService.findOne(oid);
        
        
        
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = null;
        try {
            out_trade_no = oid;

            //付款金额，必填
            String total_amount = order.getOamount().toString();
            //订单名称，必填
            String subject = order.getBphone();
            //商品描述，可空
            String body = "";

            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"total_amount\":\""+ total_amount +"\","
                    + "\"subject\":\""+ subject +"\","
                    + "\"body\":\""+ body +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

            //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
            //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
            //		+ "\"total_amount\":\""+ total_amount +"\","
            //		+ "\"subject\":\""+ subject +"\","
            //		+ "\"body\":\""+ body +"\","
            //		+ "\"timeout_express\":\"10m\","
            //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

            //请求
            result = alipayClient.pageExecute(alipayRequest).getBody();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
            result = "";
        }
        finally {
            return result;
        }
        
    }


}