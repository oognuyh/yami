package org.yami.common.security;

import java.util.Objects;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.yami.common.exception.UnauthorizedException;
import org.yami.user.dto.User;

public class SecurityUtil {

  public static User getCurrentLoggedInUser() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (Objects.isNull(authentication)) throw new UnauthorizedException();
    if (!(authentication.getPrincipal() instanceof User)) {
      throw new UnauthorizedException();
    }

    return (User) authentication.getPrincipal();
  }
}
