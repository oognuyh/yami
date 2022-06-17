package org.yami.restaurant.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.yami.restaurant.model.Restaurant;
import org.yami.restaurant.service.RestaurantService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/restaurants")
public class RestaurantApiController {
    
    private final RestaurantService restaurantService;

    @GetMapping
    public List<Restaurant> findRestaurants() {
        return restaurantService.findRestaurants();
    }

    @GetMapping("/sample")
    public Restaurant findRestaurant() {
        return restaurantService.findRestaurantByRestaurantId("26275020-ea3c-11ec-8fea-0242ac120002");
    }
}
