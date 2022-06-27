package org.yami.common.security;

import java.util.Map;
import net.bytebuddy.utility.RandomString;

public abstract class SocialUser {
  protected Map<String, Object> attributes;

  public SocialUser(Map<String, Object> attributes) {
    this.attributes = attributes;
  }

  public Map<String, Object> getAttributes() {
    return attributes;
  }

  public String getPassword() {
    return RandomString.make(15);
  }

  public abstract String getId();

  public abstract String getName();

  public abstract String getEmail();

  public abstract String getImageUrl();
}
