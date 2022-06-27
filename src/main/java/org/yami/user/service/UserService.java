package org.yami.user.service;

import org.yami.user.dto.User;

public interface UserService {

  User findUserByUserId(String userId);

  User register(User user);

  User updateUserDetails(User user);

  User changePassword(User user);

  void deleteUser(User user);
}
