package org.yami.restaurant.model;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;
import org.yami.common.annotation.JsonDateFormat;

import lombok.Builder;
import lombok.Data;

@Data
@Alias("Restaurant")
@Builder
public class Restaurant {
    
    private String restaurantId;

    private String name;

    private String phoneNumber;

    private String zipCode;

    private String address1;

    private String address2;

    private String intro;

    private int totalRating;

    private int reviewCount;

    @JsonDateFormat
    private LocalDateTime createdAt;

    @JsonDateFormat
    private LocalDateTime updatedAt;
}