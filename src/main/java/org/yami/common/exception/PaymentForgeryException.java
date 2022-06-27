package org.yami.common.exception;

public class PaymentForgeryException extends RuntimeException {

  public PaymentForgeryException() {
    super("결제 금액이 일치하지 않습니다.");
  }
}
