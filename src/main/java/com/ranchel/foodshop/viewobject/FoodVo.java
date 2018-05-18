package com.ranchel.foodshop.viewobject;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

/**
 * 商品（包含类目）
 * 类型
 */

@Data
public class FoodVo {
    @JsonProperty("name")
    private String cname;
    @JsonProperty("type")
    private Integer ctype;

    @JsonProperty("foods")
    private List<FoodInfoVo> foodInfoVoList;
}
