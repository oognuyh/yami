package org.yami.payment.dto;

import java.time.LocalDate;
import java.util.UUID;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Payment")
public class Payment {
  // 결제 고유번호
  private String paymentId = UUID.randomUUID().toString();
  // 주문 고유번호
  private String orderId;
  // 아임포트 결제 고유번호
  private String impUid;
  // 결제수단
  private String payMethod;
  // 구매자 이메일
  private String buyerEmail;
  // 구매자 이름
  private String buyerName;
  // 구매자 전화번호
  private String buyerTel;
  // 구매자 우편번호
  private String buyerPostcode;
  // 구매자 주소 1
  private String buyerAddress1;
  // 구매자 주소 2
  private String buyerAddress2;
  // 총 가격
  private int totalPrice;
  // 생성일자
  private LocalDate createdAt;
  // 수정일자
  private LocalDate updatedAt;
}
