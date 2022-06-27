package org.yami.common.security;

import java.util.Map;
import org.springframework.security.authentication.ProviderNotFoundException;

public class SocialUserFactory {

  public static SocialUser from(String registrationId, Map<String, Object> attributes) {
    if (registrationId.equalsIgnoreCase(SocialProvider.GITHUB.name())) {
      return new GithubUser(attributes);
    } else {
      throw new ProviderNotFoundException(
          String.format("%s 소셜 로그인은 아직 제공되지 않습니다.", registrationId.toUpperCase()));
    }
  }
}
