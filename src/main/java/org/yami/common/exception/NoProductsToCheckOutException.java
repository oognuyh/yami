package org.yami.common.exception;

public class NoProductsToCheckOutException extends RuntimeException {

  public NoProductsToCheckOutException() {
    super("상품없이 주문할 수 없습니다.");
  }
}
