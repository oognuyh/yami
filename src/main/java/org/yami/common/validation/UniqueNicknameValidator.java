package org.yami.common.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.yami.user.dao.UserDao;
import org.yami.user.dto.User;

@Component
@RequiredArgsConstructor
public class UniqueNicknameValidator implements ConstraintValidator<UniqueNickname, String> {

  private final UserDao userDao;

  @Override
  public boolean isValid(String nickname, ConstraintValidatorContext context) {
    if (StringUtils.hasText(nickname)) {
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      if (authentication.isAuthenticated()) {
        User user = (User) authentication.getPrincipal();
        if (user.getNickname().equals(nickname)) {
          return true;
        }
      }

      return !userDao.existsUserByNickname(nickname);
    }

    return true;
  }
}
