package com.ranchel.foodshop.controller;

import com.ranchel.foodshop.bean.CartBean;
import com.ranchel.foodshop.bean.CatagoryBean;
import com.ranchel.foodshop.dao.OrderDetailDao;
import com.ranchel.foodshop.dateobject.FoodCategory;
import com.ranchel.foodshop.dateobject.FoodInfo;
import com.ranchel.foodshop.dto.OrderDto;
import com.ranchel.foodshop.service.CategoryService;
import com.ranchel.foodshop.service.FoodService;
import com.ranchel.foodshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;


/**/
@Controller
@RequestMapping("/buyer")
public class IndexController {

    @Autowired
    private FoodService foodService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailDao orderDetailDao;

    @RequestMapping("/index")
    public ModelAndView BuyerIndex(HttpSession session,
                                    Map<String, Object>  map) {


        List<FoodCategory> foodCategoryList = categoryService.findAll();
        List<CatagoryBean> catagoryBeanList = new ArrayList<>();
        for (FoodCategory f:foodCategoryList) {
            List<FoodInfo> ff = foodService.findByCtypeIn(f.getCtype());
            if(ff.size()==0 ) continue;
            List<FoodInfo> foodInfos=ff.stream()
                    .filter(e->e.getFstatus()==0)
                    .collect(toList());
            if(foodInfos.size()==0 ) continue;
            CatagoryBean catagoryBean = new CatagoryBean();
            catagoryBean.setCtype(f.getCtype());
            catagoryBean.setCname(f.getCname());
            catagoryBean.setFoodInfos(foodInfos);
            catagoryBeanList.add(catagoryBean);

        }
        List<FoodInfo> foodInfos = foodService.findUpAll();

        List<FoodInfo> hotFoods = new ArrayList<>();

        for(int i=0;i<(foodInfos.size()>10?10:foodInfos.size());i++){
            hotFoods.add(foodInfos.get(i));
        }

        map.put("catagoryBeanList",catagoryBeanList);
        map.put("hotfoods",hotFoods);
        return new ModelAndView("buyer/index",map);
    }

    @RequestMapping("/foodlist")
    public ModelAndView BuyerList(@RequestParam(value = "ctype",required=false) Integer ctype,
                                  Map<String, Object>  map) {

        List<FoodCategory> foodCategoryList = categoryService.findAll();
        List<CatagoryBean> catagoryBeanList = new ArrayList<>();

        for (FoodCategory f:foodCategoryList) {
            List<FoodInfo> ff = foodService.findByCtypeIn(f.getCtype());
            if(ff.size()==0 ) continue;
            List<FoodInfo> foodInfos=ff.stream()
                    .filter(e->e.getFstatus()==0)
                    .collect(toList());
            if(foodInfos.size()==0 ) continue;
            CatagoryBean catagoryBean = new CatagoryBean();
            catagoryBean.setCtype(f.getCtype());
            catagoryBean.setCname(f.getCname());
            catagoryBean.setFoodInfos(foodInfos);
            catagoryBeanList.add(catagoryBean);

        }

        System.out.println(catagoryBeanList.size());
        map.put("catagoryBeanList",catagoryBeanList);

        List<FoodInfo> foodInfoList = foodService.findByCtypeIn(ctype);
        List<FoodInfo> foodInfos=foodInfoList.stream()
                .filter(e->e.getFstatus()==0)
                .collect(toList());
        System.out.println(foodInfoList.size());
        map.put("foodInfos",foodInfos);
        map.put("allcatagory",foodCategoryList);
        return new ModelAndView("buyer/list",map);
    }


    @RequestMapping("/fooddetail")
    public ModelAndView BuyerFoodDetail(@RequestParam(value = "fid",required=false) String fid,
                                  Map<String, Object>  map) {

        List<FoodCategory> foodCategoryList = categoryService.findAll();
        List<CatagoryBean> catagoryBeanList = new ArrayList<>();

        for (FoodCategory f:foodCategoryList) {
            List<FoodInfo> ff = foodService.findByCtypeIn(f.getCtype());
            if(ff.size()==0 ) continue;
            List<FoodInfo> foodInfos=ff.stream()
                    .filter(e->e.getFstatus()==0)
                    .collect(toList());
            if(foodInfos.size()==0 ) continue;
            CatagoryBean catagoryBean = new CatagoryBean();
            catagoryBean.setCtype(f.getCtype());
            catagoryBean.setCname(f.getCname());
            catagoryBean.setFoodInfos(foodInfos);
            catagoryBeanList.add(catagoryBean);

        }

        System.out.println(catagoryBeanList.size());
        map.put("catagoryBeanList",catagoryBeanList);


        map.put("allcatagory",foodCategoryList);



        FoodInfo foodInfo = foodService.findOne(fid);
        map.put("foodInfo",foodInfo);


        return new ModelAndView("buyer/detail",map);
    }


    @RequestMapping("/mycart")
    public ModelAndView BuyerMycart(HttpSession session, Map<String, Object>  map) {



        if(session.getAttribute("username")==null){
            return new ModelAndView("buyer/login");
        }else {

            if(session.getAttribute("cart")==null){
                Map<FoodInfo,Integer> cartfoods = new HashMap<>();


                CartBean cartBean = new CartBean();
                cartBean.setAll_number(0);
                cartBean.setCartfoods(cartfoods);
                cartBean.setTotalprice(0.0);

                map.put("cart",cartBean);

            }else {
                CartBean cartBean = (CartBean) session.getAttribute("cart");

                map.put("cart",cartBean);
                System.out.println(cartBean);
            }

            return new ModelAndView("buyer/mycart",map);
        }

    }


    @RequestMapping("/mycartdelete")
    public ModelAndView BuyerMycartDelete(
            @RequestParam(value = "fid",required=false) String fid,
            HttpSession session, Map<String, Object>  map) {

        if(session.getAttribute("username")==null){
            return new ModelAndView("buyer/login");
        }else {

            if(session.getAttribute("cart")==null){
                Map<FoodInfo,Integer> cartfoods = new HashMap<>();

                CartBean cartBean = new CartBean();
                cartBean.setAll_number(0);
                cartBean.setCartfoods(cartfoods);
                cartBean.setTotalprice(0.0);

                map.put("cart",cartBean);

            }else {
                CartBean cartBean = (CartBean) session.getAttribute("cart");

                Map<FoodInfo,Integer> foodmap = cartBean.getCartfoods();

                Set<FoodInfo> foodInfoSet = foodmap.keySet();

                for(FoodInfo f:foodInfoSet){
                    if(f.getFid().equals(fid)){
                        cartBean.setTotalprice(cartBean.getTotalprice() - f.getFprice().doubleValue()*foodmap.get(f));
                        cartBean.setAll_number(cartBean.getAll_number()-1);
                        foodmap.remove(f);

                    }
                }
                cartBean.setCartfoods(foodmap);
                map.put("cart",cartBean);
                System.out.println(cartBean);
            }

            return new ModelAndView("buyer/mycart",map);
        }

    }


    @RequestMapping("/myorderlist")
    public ModelAndView BuyerMyorder(HttpSession session,
                                     @RequestParam(value = "page",defaultValue = "0") Integer page,
                                     @RequestParam(value = "size",defaultValue ="10") Integer size,
                                     Map<String, Object>  map) {

        if(session.getAttribute("username")==null){
            return new ModelAndView("buyer/login");
        }else {
            String username = (String) session.getAttribute("username");
            List<FoodCategory> foodCategoryList = categoryService.findAll();
            List<CatagoryBean> catagoryBeanList = new ArrayList<>();

            for (FoodCategory f:foodCategoryList) {
                List<FoodInfo> ff = foodService.findByCtypeIn(f.getCtype());
                if(ff.size()==0 ) continue;
                List<FoodInfo> foodInfos=ff.stream()
                        .filter(e->e.getFstatus()==0)
                        .collect(toList());
                if(foodInfos.size()==0 ) continue;
                CatagoryBean catagoryBean = new CatagoryBean();
                catagoryBean.setCtype(f.getCtype());
                catagoryBean.setCname(f.getCname());
                catagoryBean.setFoodInfos(foodInfos);
                catagoryBeanList.add(catagoryBean);

            }

            System.out.println(catagoryBeanList.size());
            map.put("catagoryBeanList",catagoryBeanList);

            map.put("allcatagory",foodCategoryList);
            PageRequest request=new PageRequest(page,size);
            Page<OrderDto> orderDtoPage=orderService.findList(username,request);

            for(OrderDto order:orderDtoPage){
                order.setOrderDetailsList(orderDetailDao.findByOid(order.getOid()));
            }

            map.put("orderDtoPage",orderDtoPage);
            map.put("currentPage",page);
            map.put("size",size);

            return new ModelAndView("buyer/myorderlist",map);
        }


    }

    @RequestMapping("/order")
    public ModelAndView BuyerOrder( HttpSession session,Map<String, Object>  map) {

        if(session.getAttribute("username")==null){
            return new ModelAndView("buyer/login");
        }else {

            if(session.getAttribute("cart")==null){
                Map<FoodInfo,Integer> cartfoods = new HashMap<>();

                CartBean cartBean = new CartBean();
                cartBean.setAll_number(0);
                cartBean.setCartfoods(cartfoods);
                cartBean.setTotalprice(0.0);

                map.put("cart",cartBean);

            }else {
                CartBean cartBean = (CartBean) session.getAttribute("cart");
                map.put("cart",cartBean);
                System.out.println(cartBean);
            }

            return new ModelAndView("buyer/order",map);
        }
    }



    @RequestMapping("/pay")
    public ModelAndView BuyerPay(@RequestParam(value = "oid",required=false) String oid,
                                 Map<String, Object>  map) {


        OrderDto orderDto = orderService.findOne(oid);
        map.put("orderDto",orderDto);

        return new ModelAndView("buyer/pay",map);
    }

    @RequestMapping("/alipay")
    public ModelAndView BuyerAliPay(@RequestParam(value = "oid",required=false) String oid,
                                 Map<String, Object>  map) {

        OrderDto orderDto = orderService.findOne(oid);
        map.put("orderDto",orderDto);

        return new ModelAndView("buyer/pay",map);
    }



    @RequestMapping("/userlogout")
    public ModelAndView BuyerLogout(HttpSession session, Map<String, Object>  map) {


        session.removeAttribute("username");

        List<FoodCategory> foodCategoryList = categoryService.findAll();
        List<CatagoryBean> catagoryBeanList = new ArrayList<>();

        for (FoodCategory f:foodCategoryList) {

            List<FoodInfo> foodInfos = foodService.findByCtypeIn(f.getCtype());
            if(foodInfos.size()==0) continue;
            CatagoryBean catagoryBean = new CatagoryBean();
            catagoryBean.setCname(f.getCname());
            catagoryBean.setCtype(f.getCtype());
            catagoryBean.setFoodInfos(foodInfos);
            catagoryBeanList.add(catagoryBean);
        }

        System.out.println(catagoryBeanList.size());
        map.put("catagoryBeanList",catagoryBeanList);


        map.put("allcatagory",foodCategoryList);



        return new ModelAndView("buyer/index",map);
    }

}




