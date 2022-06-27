package org.yami.user.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yami.common.exception.UserNotFoundException;
import org.yami.user.dao.UserDao;
import org.yami.user.dto.User;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

  private final UserDao userDao;

  private final PasswordEncoder passwordEncoder;

  @Override
  @Transactional(readOnly = true)
  public User findUserByUserId(String userId) {
    log.debug("Received {}", userId);

    return userDao.findUserByUserId(userId).orElseThrow(UserNotFoundException::new);
  }

  @Override
  @Transactional
  public User register(User user) {
    log.debug("Received {}", user);

    user.setPassword(passwordEncoder.encode(user.getPassword()));

    log.debug("Encoded user's password");

    userDao.saveUser(user);

    return user;
  }

  @Override
  @Transactional
  public User updateUserDetails(User user) {
    log.debug("Received {}", user);

    User existingUser =
        userDao.findUserByUserId(user.getUserId()).orElseThrow(UserNotFoundException::new);

    log.debug("Found a matching user({})", existingUser);

    existingUser.updateDetails(user);

    userDao.updateUserDetails(user);

    log.debug("The user has been uccessfully updated to {}", existingUser);

    return existingUser;
  }

  @Override
  public User changePassword(User user) {
    log.debug("Received {}", user);

    User existingUser =
        userDao.findUserByUserId(user.getUserId()).orElseThrow(UserNotFoundException::new);

    existingUser.setPassword(passwordEncoder.encode(user.getPassword()));

    log.debug("Encoded user's password");

    userDao.updatePassword(existingUser);

    return null;
  }

  @Override
  public void deleteUser(User user) {
    log.debug("Received {}", user);

    userDao.deleteUserByUserId(user.getUserId());
  }
}
