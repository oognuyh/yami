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
public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

  private final UserDao userDao;

  @Override
  public boolean isValid(String email, ConstraintValidatorContext context) {
    if (StringUtils.hasText(email)) {
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      if (authentication.isAuthenticated()) {
        User user = (User) authentication.getPrincipal();
        if (user.getEmail().equals(email)) {
          return true;
        }
      }

      return !userDao.existsUserByEmail(email);
    }

    return true;
  }
}
