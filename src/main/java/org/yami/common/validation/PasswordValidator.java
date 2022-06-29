package org.yami.common.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.yami.common.exception.UserNotFoundException;
import org.yami.common.security.SecurityUtil;
import org.yami.user.dao.UserDao;
import org.yami.user.dto.LoginType;
import org.yami.user.dto.User;

@Component
@RequiredArgsConstructor
public class PasswordValidator implements ConstraintValidator<Password, String> {

  private final UserDao userDao;

  private final PasswordEncoder passwordEncoder;

  @Override
  public boolean isValid(String password, ConstraintValidatorContext context) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication.getClass() == AnonymousAuthenticationToken.class) {
      if (StringUtils.hasText(password)) {
        return true;
      } else {
        context.disableDefaultConstraintViolation();
        context.buildConstraintViolationWithTemplate("비밀번호를 입력하세요.").addConstraintViolation();

        return false;
      }
    } else {
      User user =
          userDao
              .findUserByUserId(SecurityUtil.getCurrentLoggedInUserId())
              .orElseThrow(UserNotFoundException::new);

      if (StringUtils.hasText(password)) {
        if (user.getLoginType().equals(LoginType.LOCAL)) {
          return passwordEncoder.matches(password, user.getPassword());
        } else {
          return true;
        }
      } else {
        if (user.getLoginType().equals(LoginType.SOCIAL)) {
          return true;
        } else {
          context.disableDefaultConstraintViolation();
          context.buildConstraintViolationWithTemplate("비밀번호를 입력하세요.").addConstraintViolation();

          return false;
        }
      }
    }
  }
}
