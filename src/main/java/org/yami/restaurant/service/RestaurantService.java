package org.yami.restaurant.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.yami.restaurant.dao.RestaurantDao;
import org.yami.restaurant.model.Restaurant;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RestaurantService {
    
    private final RestaurantDao memberDao;

    public List<Restaurant> findRestaurants() {
        return memberDao.findRestaurants();
    }

    public Restaurant findRestaurantByRestaurantId(String restaurantId) {
        return memberDao.findRestaurantByRestaurantId(restaurantId)
            .orElseThrow();
    }
}
