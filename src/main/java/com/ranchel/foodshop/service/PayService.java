package com.ranchel.foodshop.service;

import com.ranchel.foodshop.dto.OrderDto;

public interface PayService {
    void create(OrderDto orderDto);
}
