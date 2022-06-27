package org.yami.common.exception;

public class UnauthorizedException extends RuntimeException {

  public UnauthorizedException() {
    super("로그인이 필요한 서비스입니다.");
  }
}
