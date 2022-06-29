package org.yami.common.security;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.yami.common.exception.UnauthorizedException;
import org.yami.user.dto.User;

public class SecurityUtil {

  public static User getCurrentLoggedInUser() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication.getClass() == AnonymousAuthenticationToken.class)
      throw new UnauthorizedException();
    if (authentication.getPrincipal().getClass() != User.class) {
      throw new UnauthorizedException();
    }

    return (User) authentication.getPrincipal();
  }

  public static String getCurrentLoggedInUserId() {
    return getCurrentLoggedInUser().getUserId();
  }
}
