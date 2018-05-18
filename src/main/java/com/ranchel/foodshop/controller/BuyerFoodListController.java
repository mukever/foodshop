package com.ranchel.foodshop.controller;

import com.ranchel.foodshop.dateobject.FoodInfo;
import com.ranchel.foodshop.service.CategoryService;
import com.ranchel.foodshop.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/buyer/")
public class BuyerFoodListController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private FoodService foodService;

    /**
     * 类目列表
     *
     * @param map
     * @return
     */
    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "ctype", required = false,defaultValue = "1") Integer ctype,
                             @RequestParam(value = "page",defaultValue = "1") Integer page,
                             @RequestParam(value = "size",defaultValue ="10") Integer size,
                             Map<String,Object> map
                             ) {
        //分页
        PageRequest request=new PageRequest(page-1,size);
        Page<FoodInfo> foodInfoPage=foodService.findAll(request);
        map.put("foodInfoPage",foodInfoPage);
        map.put("currentPage",page);
        map.put("size",size);

        //1.查询所有商品
        List<FoodInfo> foodInfosList= foodService.findByCtypeIn(ctype);

        System.out.println(foodInfosList);
        map.put("foodInfoList",foodInfosList);

        return new ModelAndView("buyer/list",map);
    }
}
