package com.ranchel.foodshop.bean;


import com.ranchel.foodshop.dateobject.FoodInfo;
import lombok.Data;

import javax.persistence.criteria.CriteriaBuilder;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Data
public class CartBean {
    private Map<FoodInfo,Integer> cartfoods;
    private int all_number;
    private Double totalprice;


}
