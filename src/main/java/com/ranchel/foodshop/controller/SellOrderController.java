package com.ranchel.foodshop.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.ranchel.foodshop.api.AlipayConfig;
import com.ranchel.foodshop.dto.OrderDto;
import com.ranchel.foodshop.enums.OrderPayStatusEnum;
import com.ranchel.foodshop.enums.ResultEnum;
import com.ranchel.foodshop.exception.ShopException;
import com.ranchel.foodshop.service.BuyerService;
import com.ranchel.foodshop.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

//卖家端订单
@Controller
@RequestMapping("seller/order")
@Slf4j
public class SellOrderController {
    @Autowired
    private BuyerService buyerService;
    @Autowired
    private OrderService orderService;

    /**
     * 订单列表
     * page 第几页从1开始
     * size每一页有多少
     */
    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "10") Integer size,
                             Map<String, Object> map) {
        PageRequest request = new PageRequest(page - 1, size);
        Page<OrderDto> orderDtoPage = orderService.findList(request);
        map.put("orderDtoPage", orderDtoPage);
        map.put("currentPage", page);
        map.put("size", size);
        return new ModelAndView("order/list", map);
    }

    //取消订单，参数为oid
    @GetMapping("/cancel")
    public ModelAndView cancel(@RequestParam("oid") String oid,
                               Map<String, Object> map) {
        try {
            OrderDto orderDto = orderService.findOne(oid);

            //得到订单是否支付

            OrderPayStatusEnum is_pay = orderDto.getOrderPayStatus();

            if (is_pay.getCode() == 1) {
                //需要向支付宝提交退款请求
                refund(orderDto);

            }
            orderService.cancel(orderDto);
        } catch (ShopException e) {
            log.error("[卖家端取消订单] 发生异常{}", e);
            map.put("msg", e.getMessage());
            map.put("url", "/foodshop/seller/order/list");
            return new ModelAndView("common/error", map);

        }
        // if (orderDto==null){ }
        map.put("msg", ResultEnum.ORDER_CANCEL_SUCCESS.getMessage());
        map.put("url", "/foodshop/seller/order/list");
        return new ModelAndView("common/success");
    }

    //订单详情，参数oid,map
    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam("oid") String oid,
                               Map<String, Object> map) {
        OrderDto orderDto = new OrderDto();
        try {
            orderDto = orderService.findOne(oid);
        } catch (ShopException e) {
            log.error("[卖家端查询订单] 发生异常{}", e);
            map.put("msg", e.getMessage());
            map.put("url", "/foodshop/seller/order/list");
            return new ModelAndView("common/error", map);
        }
        map.put("orderDto", orderDto);
        return new ModelAndView("order/detail", map);
    }

    @GetMapping("/finish")
    public ModelAndView finish(@RequestParam("oid") String oid,
                               Map<String, Object> map) {
        try {
            OrderDto orderDto = orderService.findOne(oid);

            orderService.finish(orderDto);
        } catch (ShopException e) {
            log.error("[卖家端完结订单] 发生异常{}", e);
            map.put("msg", e.getMessage());
            map.put("url", "/foodshop/seller/order/list");
            return new ModelAndView("common/error", map);
        }
        map.put("msg", ResultEnum.ORDER_FINISH_SUCCESS.getMessage());
        map.put("url", "/foodshop/seller/order/list");
        return new ModelAndView("common/success");
    }


    private int refund(OrderDto orderDto) {

        //付款金额，必填
        String total_amount = orderDto.getOamount().toString();
        //订单名称，必填
        String subject = "在线生鲜" + orderDto.getOid();
        //商品描述，可空
        String body = "共计￥" + orderDto.getOamount() + " 元";

        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();

        request.setBizContent("{\"out_trade_no\":\"" + orderDto.getOid() + "\","
                +"\"trade_no\":\""+ orderDto.getTrade_no() +"\","
                + "\"refund_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\"}");

        AlipayTradeRefundResponse response = null;
        try {
            alipayClient.execute(request);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        return 1;
    }


}
