package org.yami.order.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.yami.common.annotation.JsonDateFormat;
import org.yami.payment.dto.Payment;

@Data
@Alias("Order")
public class Order {
  // 주문 고유번호
  private String orderId = UUID.randomUUID().toString();
  // 회원 고유번호
  private String userId;
  // 주문명
  private String name;
  // 총 가격
  private int totalPrice;
  // 수령인 이메일
  private String recipientEmail;
  // 수령인 이름
  private String recipientName;
  // 수령인 전화번호
  private String recipientTel;
  // 수령인 우편번호
  private String recipientPostcode;
  // 수령인 주소 1
  private String recipientAddress1;
  // 수령인 주소 2
  private String recipientAddress2;
  // 생성일자
  @JsonDateFormat private LocalDateTime createdAt;
  // 수정일자
  @JsonDateFormat private LocalDateTime updatedAt;
  // 주문 항목
  private List<OrderItem> orderItems = new ArrayList<>();
  // 결제
  private Payment payment;

  public void truncateName() {
    String baseCategoryName = this.orderItems.get(0).getProduct().getCategoryName();

    this.name =
        this.orderItems.size() > 1
            ? baseCategoryName + " 외 " + (this.orderItems.size() - 1)
            : baseCategoryName;
  }

  public void calculateTotalPrice() {
    if (this.orderItems.isEmpty()) return;

    this.totalPrice =
        this.orderItems.stream()
            .map((orderItem) -> orderItem.getQuantity() * orderItem.getProduct().getPrice())
            .mapToInt(Integer::intValue)
            .sum();
  }
}
