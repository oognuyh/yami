package org.yami.order.dto;

import java.time.LocalDateTime;
import java.util.UUID;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.yami.common.annotation.JsonDateFormat;
import org.yami.product.dto.Product;

@Data
@Alias("OrderItem")
public class OrderItem {
  // 주문 항목 고유번호
  private String orderItemId = UUID.randomUUID().toString();
  // 회원 고유번호
  private String userId;
  // 주문 고유번호
  private String orderId;
  // 상품 고유번호
  private String productId;
  // 수량
  private int quantity;
  // 생성일자
  @JsonDateFormat private LocalDateTime createdAt;
  // 수정일자
  @JsonDateFormat private LocalDateTime updatedAt;

  private Product product;
}
