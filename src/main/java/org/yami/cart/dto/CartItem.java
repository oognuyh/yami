package org.yami.cart.dto;

import java.time.LocalDateTime;
import java.util.UUID;

import org.apache.ibatis.type.Alias;
import org.yami.common.annotation.JsonDateFormat;

import lombok.Data;

@Data
@Alias("CartItem")
public class CartItem {
  // 장바구니 항목 고유번호
  private String cartItemId = UUID.randomUUID().toString();
  // 회원 고유번호
  private String userId;
  // 상품 고유번호
  private String productId;
  // 수량
  private int quantity;
  // 생성일자
  @JsonDateFormat
  private LocalDateTime createdAt;
  // 수정일자
  @JsonDateFormat
  private LocalDateTime updatedAt;
  // products
  
  private String name;
  
  private int price;
}
