package com.ranchel.foodshop.api;


import com.ranchel.foodshop.bean.CartBean;
import com.ranchel.foodshop.dao.OrderDetailDao;
import com.ranchel.foodshop.dao.OrderMasterDao;
import com.ranchel.foodshop.dateobject.ApiMessage;
import com.ranchel.foodshop.dateobject.FoodCategory;
import com.ranchel.foodshop.dateobject.FoodInfo;
import com.ranchel.foodshop.dateobject.OrderDetail;
import com.ranchel.foodshop.dto.OrderDto;
import com.ranchel.foodshop.enums.ApiCodeEnum;
import com.ranchel.foodshop.service.CategoryService;
import com.ranchel.foodshop.service.FoodService;
import com.ranchel.foodshop.service.OrderService;
import com.ranchel.foodshop.utils.ResultVoUtils;
import com.ranchel.foodshop.viewobject.FoodInfoVo;
import com.ranchel.foodshop.viewobject.FoodVo;
import com.ranchel.foodshop.viewobject.ResultVo;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@SessionAttributes
@RequestMapping("/api")
public class Cart {

    @Autowired
    private FoodService foodService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private OrderService orderService;
    /**
     * 返回类别json 数据
     * @param
     * @param response
     * @return
     */
    @RequestMapping("/addtocart")
    @ResponseBody
    public ApiMessage AddToCart(
            HttpSession session,
            HttpServletRequest request, HttpServletResponse response) {

        HttpServletRequest requests = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        //已经拿到session,就可以拿到session中保存的用户信息了。
        System.out.println("别的方式拿到session"+requests.getSession().getAttribute("username"));
        //跨域设置
        Common.common(response);
        ApiMessage apiMessage = new ApiMessage();
        String fid = request.getParameter("fid");
        int number = Integer.valueOf(request.getParameter("number"));

        String username = (String) session.getAttribute("username");
        System.out.println("ADDTOCART get session" + username);
        if(username==null){
            apiMessage.setCode(ApiCodeEnum.NOTLOGIN.getCode());
            apiMessage.setMessage(ApiCodeEnum.NOTLOGIN.getMessage());
        }else {

            if(session.getAttribute("cart")==null){
                Map<FoodInfo,Integer> cartfoods = new HashMap<>();
                FoodInfo foodInfo = foodService.findOne(fid);
                cartfoods.put(foodInfo,number);
                System.out.println(foodInfo);
                CartBean cartBean = new CartBean();
                cartBean.setAll_number(1);
                cartBean.setCartfoods(cartfoods);
                cartBean.setTotalprice(foodInfo.getFprice().doubleValue()*number);

                session.setAttribute("cart",cartBean);

            }else {
                CartBean cartBean = (CartBean) session.getAttribute("cart");
                Map<FoodInfo,Integer> cartfoods = cartBean.getCartfoods();
                Set<FoodInfo> foodInfoSet = cartfoods.keySet();
                FoodInfo foodInfo= foodService.findOne(fid);
                if(foodInfoSet.contains(foodInfo)){

                    int new_number =  cartfoods.get(foodInfo) + number;

                    cartfoods.put(foodInfo,new_number);
                }else {
                    cartfoods.put(foodInfo,number);
                    cartBean.setAll_number(cartBean.getAll_number()+1);
                }
                cartBean.setCartfoods(cartfoods);
                cartBean.setTotalprice(cartBean.getTotalprice()+foodInfo.getFprice().doubleValue()*number);

                session.setAttribute("cart",cartBean);
                System.out.println(cartBean);
            }


            apiMessage.setCode(ApiCodeEnum.ADDTOCARTSUCCESS.getCode());
            apiMessage.setMessage(ApiCodeEnum.ADDTOCARTSUCCESS.getMessage());
        }

        return apiMessage;

    }

    /**
     * 返回类别json 数据
     * @param session
     * @param response
     * @return
     */
    @RequestMapping("/count")
    @ResponseBody
    public ApiMessage Count(HttpServletRequest request,HttpSession session, HttpServletResponse response) {

        @Data
        class ApiCountMessage extends ApiMessage{

            private String oid;

        }
        //跨域设置
        Common.common(response);
        ApiMessage apiMessage = new ApiCountMessage();


        if(session.getAttribute("username")==null){
            apiMessage.setCode(ApiCodeEnum.NOTLOGIN.getCode());
            apiMessage.setMessage(ApiCodeEnum.NOTLOGIN.getMessage());
        }else {


            //获取参数
            String address = request.getParameter("address");
            String get_name = request.getParameter("getName");
            String get_phone = request.getParameter("getPhone");

            //数据库操作
            //获取session数据
            CartBean cartBean = (CartBean) session.getAttribute("cart");
            System.out.println(cartBean);
            double totalprice = cartBean.getTotalprice();

            Map<FoodInfo,Integer> foodInfomap =  cartBean.getCartfoods();

            List<OrderDetail> orderDetails = new ArrayList<>();
            Iterator it = foodInfomap.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                FoodInfo key = (FoodInfo) entry.getKey();
                int value = (int) entry.getValue();
                OrderDetail orderDetail = new OrderDetail();

                BeanUtils.copyProperties(key,orderDetail);
                orderDetail.setFquantity(value);
                orderDetails.add(orderDetail);
            }
            OrderDto orderDto = new OrderDto();
            orderDto.setOrderDetailsList(orderDetails);
            orderDto.setBaddress(address);
            orderDto.setBnickname(get_phone);
            orderDto.setOamount(new BigDecimal(totalprice));
            orderDto.setBphone(get_phone);
            orderDto.setBname(get_name);

            OrderDto ord = orderService.create(orderDto);

            ((ApiCountMessage) apiMessage).setOid(ord.getOid());

            //清除session

            session.removeAttribute("cart");

            apiMessage.setCode(ApiCodeEnum.COUNTSUCCESS.getCode());
            apiMessage.setMessage(ApiCodeEnum.COUNTSUCCESS.getMessage());
        }

        return apiMessage;



    }
}


