package com.ranchel.foodshop.controller;

import com.ranchel.foodshop.bean.CartBean;
import com.ranchel.foodshop.bean.CatagoryBean;
import com.ranchel.foodshop.dateobject.FoodCategory;
import com.ranchel.foodshop.dateobject.FoodInfo;
import com.ranchel.foodshop.dto.OrderDto;
import com.ranchel.foodshop.service.CategoryService;
import com.ranchel.foodshop.service.FoodService;
import com.ranchel.foodshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;


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

    @RequestMapping("/index")
    public ModelAndView BuyerIndex(HttpSession session,
                                    Map<String, Object>  map) {


        List<FoodCategory> foodCategoryList = categoryService.findAll();
        List<CatagoryBean> catagoryBeanList = new ArrayList<>();
        for (FoodCategory f:foodCategoryList) {
            CatagoryBean catagoryBean = new CatagoryBean();

            List<FoodInfo> foodInfos = foodService.findByCtypeIn(f.getCtype());
            if(foodInfos.size()==0) continue;
            catagoryBean.setCname(f.getCname());
            catagoryBean.setCtype(f.getCtype());
            catagoryBean.setFoodInfos(foodInfos);
            catagoryBeanList.add(catagoryBean);

        }
        List<FoodInfo> foodInfos = foodService.findUpAll();
        FoodInfo firstOne = new FoodInfo();
        if(!foodInfos.isEmpty()){
            firstOne = foodInfos.get(0);
        }

        List<FoodInfo> hotFoods = new ArrayList<>();

        for(int i=1;i<(foodInfos.size()>9?9:foodInfos.size());i++){
            hotFoods.add(foodInfos.get(i));
        }

        map.put("catagoryBeanList",catagoryBeanList);
        map.put("hotfoods",hotFoods);
        map.put("firstOne",firstOne);
        return new ModelAndView("buyer/index",map);
    }

    @RequestMapping("/foodlist")
    public ModelAndView BuyerList(@RequestParam(value = "ctype",required=false) Integer ctype,
                                  Map<String, Object>  map) {

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


        List<FoodInfo> foodInfoList = foodService.findByCtypeIn(ctype);

        System.out.println(foodInfoList.size());

        map.put("foodInfos",foodInfoList);
        map.put("allcatagory",foodCategoryList);
        return new ModelAndView("buyer/list",map);
    }


    @RequestMapping("/fooddetail")
    public ModelAndView BuyerFoodDetail(@RequestParam(value = "fid",required=false) String fid,
                                  Map<String, Object>  map) {

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


    @RequestMapping("/myorder")
    public ModelAndView BuyerMyorder( Map<String, Object>  map) {

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



        return new ModelAndView("buyer/myorder",map);
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




