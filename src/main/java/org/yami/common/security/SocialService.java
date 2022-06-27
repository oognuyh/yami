package org.yami.common.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.yami.user.dao.UserDao;
import org.yami.user.dto.User;

@Service
@RequiredArgsConstructor
public class SocialService extends DefaultOAuth2UserService {

  private final UserDao userDao;

  @Override
  public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
    SocialUser socialUser =
        SocialUserFactory.from(
            userRequest.getClientRegistration().getRegistrationId(),
            super.loadUser(userRequest).getAttributes());
    User user = User.from(socialUser);

    return userDao
        .findUserByEmailAndLoginType(user.getEmail(), user.getLoginType())
        .map(
            (existingUser) -> {
              existingUser.updateDetails(user);

              userDao.updateUserDetails(existingUser);

              return existingUser;
            })
        .orElseGet(
            () -> {
              userDao.saveUser(user);

              return user;
            });
  }
}
