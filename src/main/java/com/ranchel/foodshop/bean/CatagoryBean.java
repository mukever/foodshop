package com.ranchel.foodshop.bean;

import com.ranchel.foodshop.dateobject.FoodInfo;
import lombok.Data;

import java.util.List;

@Data
public class CatagoryBean{

    private String cname;
    private Integer ctype;
    private List<FoodInfo> foodInfos;

}