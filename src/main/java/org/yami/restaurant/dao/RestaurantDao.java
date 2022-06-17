package org.yami.restaurant.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.yami.restaurant.model.Restaurant;

@Mapper
public interface RestaurantDao {
    
    @Select("SELECT * FROM restaurant")
    List<Restaurant> findRestaurants();

    Optional<Restaurant> findRestaurantByRestaurantId(@Param("restaurantId") String restaurantId);
}
