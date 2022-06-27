package org.yami.user.service;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.BDDMockito;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.yami.user.dao.UserDao;
import org.yami.user.dto.Role;
import org.yami.user.dto.User;

@ActiveProfiles("test")
@ExtendWith(MockitoExtension.class)
@ContextConfiguration(classes = {UserServiceImpl.class})
public class UserServiceTest {

  @InjectMocks private UserServiceImpl userService;

  @Mock private UserDao userDao;

  @Test
  public void should_register_user_when_receive_valid_new_user() {
    // given
    User user = new User();

    user.setRole(Role.ROLE_USER);
    user.setEmail("test@yami.org");

    BDDMockito.given(userDao.saveUser(any(User.class))).willAnswer((invocation) -> 1);

    // when
    User actual = userService.register(user);

    // then
    Assertions.assertAll(() -> Assertions.assertEquals(user.getUserId(), actual.getUserId()));

    verify(userDao).saveUser(any(User.class));
  }
}
