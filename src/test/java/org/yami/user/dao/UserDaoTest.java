package org.yami.user.dao;

import java.util.Optional;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.yami.common.configuration.DataSourceConfig;
import org.yami.common.configuration.DatabaseConfig;
import org.yami.user.dto.LoginType;
import org.yami.user.dto.Role;
import org.yami.user.dto.User;

@ActiveProfiles("test")
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {DatabaseConfig.class, DataSourceConfig.class})
public class UserDaoTest {

  @Autowired private UserDao userDao;

  @Test
  public void should_return_matching_user_when_find_user_by_email_and_login_type() {
    // given
    String email = "tester01@yami.org";
    LoginType loginType = LoginType.LOCAL;

    // when
    User actual = userDao.findUserByEmailAndLoginType(email, loginType).orElse(null);

    // then
    Assertions.assertAll(
        () -> Assertions.assertNotNull(actual),
        () -> Assertions.assertEquals(email, actual.getEmail()),
        () -> Assertions.assertEquals(loginType, actual.getLoginType()));
  }

  @Test
  public void should_return_valid_user_when_save_user() {
    // given
    User expected = new User();

    expected.setName("name");
    expected.setNickname("nickname");
    expected.setEmail("email@yami.org");
    expected.setPassword("password");
    expected.setPostcode("postcode");
    expected.setAddress1("address1");
    expected.setAddress2("address2");
    expected.setLoginType(LoginType.LOCAL);
    expected.setRole(Role.ROLE_USER);

    // when
    boolean isSuccessful = userDao.saveUser(expected) == 1;
    User actual = userDao.findUserByUserId(expected.getUserId()).orElseThrow();

    // then
    Assertions.assertAll(
        () -> Assertions.assertTrue(isSuccessful),
        () -> Assertions.assertEquals(expected.getUserId(), actual.getUserId()),
        () -> Assertions.assertNotNull(actual.getCreatedAt()));
  }

  @Test
  public void should_return_true_when_find_existing_email() {
    // given
    String email = "tester01@yami.org";

    // when
    boolean isExisting = userDao.existsUserByEmail(email);

    // then
    Assertions.assertAll(() -> Assertions.assertTrue(isExisting));
  }

  @Test
  public void should_return_false_when_find_not_existing_email() {
    // given
    String email = "not_existing_email";

    // when
    boolean isExisting = userDao.existsUserByEmail(email);

    // then
    Assertions.assertAll(() -> Assertions.assertFalse(isExisting));
  }

  @Test
  public void should_return_changed_user_when_update_user_details() {
    // given
    String email = "tester01@yami.org";
    LoginType loginType = LoginType.LOCAL;

    User expected = new User();

    expected.setName("new name");
    expected.setNickname("new nickname");
    expected.setPassword("new password");
    expected.setPostcode("new postcode");
    expected.setAddress1("new address1");
    expected.setAddress2("new address2");

    // when
    User user = userDao.findUserByEmailAndLoginType(email, loginType).orElseThrow();

    user.updateDetails(expected);

    boolean isSuccessful = userDao.updateUserDetails(user) == 1;
    User actual = userDao.findUserByEmailAndLoginType(email, loginType).orElseThrow();

    // then
    Assertions.assertAll(
        () -> Assertions.assertTrue(isSuccessful),
        () -> Assertions.assertEquals(user.getUserId(), actual.getUserId()),
        () -> Assertions.assertEquals(email, actual.getEmail()),
        () -> Assertions.assertEquals(expected.getNickname(), actual.getNickname()),
        () -> Assertions.assertNotEquals(expected.getPassword(), actual.getPassword()),
        () -> Assertions.assertEquals(expected.getPostcode(), actual.getPostcode()),
        () -> Assertions.assertEquals(expected.getAddress1(), actual.getAddress1()),
        () -> Assertions.assertEquals(expected.getAddress2(), actual.getAddress2()));
  }

  @Test
  public void should_return_new_password_when_update_user_password() {
    // given
    User mock = new User();

    mock.setName("name");
    mock.setNickname("nickname");
    mock.setEmail("email@yami.org");
    mock.setPassword("password");
    mock.setPostcode("postcode");
    mock.setAddress1("address1");
    mock.setAddress2("address2");
    mock.setLoginType(LoginType.LOCAL);
    mock.setRole(Role.ROLE_USER);

    Assertions.assertTrue(userDao.saveUser(mock) == 1);

    String expected = "new password";

    // when
    mock.setPassword(expected);

    boolean isSuccessful = userDao.updatePassword(mock) == 1;
    User actual = userDao.findUserByUserId(mock.getUserId()).orElseThrow();

    // then
    Assertions.assertAll(
        () -> Assertions.assertTrue(isSuccessful),
        () -> Assertions.assertEquals(expected, actual.getPassword()));
  }

  @Test
  public void should_return_null_when_find_user_after_deleting() {
    // given
    String email = "tester01@yami.org";
    LoginType loginType = LoginType.LOCAL;

    User mock = userDao.findUserByEmailAndLoginType(email, loginType).orElseThrow();

    // when
    boolean isSuccessful = userDao.deleteUserByUserId(mock.getUserId()) == 1;
    Optional<User> actual = userDao.findUserByUserId(mock.getUserId());

    // then
    Assertions.assertAll(
        () -> Assertions.assertTrue(isSuccessful), () -> Assertions.assertTrue(actual.isEmpty()));
  }
}
