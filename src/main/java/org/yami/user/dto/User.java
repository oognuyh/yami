package org.yami.user.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.yami.common.annotation.JsonDateFormat;
import org.yami.common.security.SocialUser;
import org.yami.common.validation.Password;
import org.yami.common.validation.UniqueEmail;
import org.yami.common.validation.UniqueNickname;
import org.yami.common.validation.ValidationGroup.DeleteUser;
import org.yami.common.validation.ValidationGroup.RegisterUser;
import org.yami.common.validation.ValidationGroup.UpdatePassword;
import org.yami.common.validation.ValidationGroup.UpdateUserDetails;

@Data
@Alias("User")
public class User implements UserDetails, OAuth2User {

  private String userId = UUID.randomUUID().toString();

  @NotBlank(
      groups = {RegisterUser.class, UpdateUserDetails.class},
      message = "이름을 입력하세요.")
  private String name;

  @NotBlank(
      groups = {RegisterUser.class, UpdateUserDetails.class},
      message = "닉네임을 입력하세요.")
  @UniqueNickname(groups = {RegisterUser.class, UpdateUserDetails.class})
  private String nickname;

  @NotBlank(
      groups = {RegisterUser.class, UpdateUserDetails.class},
      message = "이메일을 입력하세요.")
  @Email(
      groups = {RegisterUser.class, UpdateUserDetails.class},
      message = "이메일이 양식에 맞지 않습니다.")
  @UniqueEmail(groups = {RegisterUser.class, UpdateUserDetails.class})
  private String email;

  @Pattern(
      regexp = "^0[0-9]{8,10}$",
      groups = {UpdateUserDetails.class, RegisterUser.class},
      message = "전화번호가 양식에 맞지 않습니다.")
  private String tel;

  @Password(
      groups = {
        UpdatePassword.class,
        RegisterUser.class,
        UpdateUserDetails.class,
        DeleteUser.class
      })
  @Size(min = 8, max = 16, message = "8자 이상 20자 이하 비밀번호를 입력하세요.")
  private String password;

  private String confirmPassword;

  @NotBlank(groups = {UpdatePassword.class})
  @Size(min = 8, max = 16, message = "8자 이상 20자 이하 비밀번호를 입력하세요.")
  private String newPassword;

  private String confirmNewPassword;

  @Size(
      max = 10,
      groups = {UpdateUserDetails.class, RegisterUser.class})
  private String postcode;

  @Size(
      max = 200,
      groups = {UpdateUserDetails.class, RegisterUser.class})
  private String address1;

  @Size(
      max = 200,
      groups = {UpdateUserDetails.class, RegisterUser.class})
  private String address2;

  private String imageUrl;

  @JsonIgnore private Role role = Role.ROLE_USER;

  @JsonIgnore private LoginType loginType = LoginType.LOCAL;

  @JsonDateFormat private LocalDateTime createdAt;

  @JsonDateFormat private LocalDateTime updatedAt;

  @JsonIgnore private Map<String, Object> attributes;

  @AssertTrue(
      groups = {RegisterUser.class},
      message = "비밀번호가 일치하지 않습니다.")
  public boolean isConfirmPassword() {
    return this.password.equals(this.confirmPassword);
  }

  @AssertTrue(
      groups = {UpdatePassword.class},
      message = "비밀번호가 일치하지 않습니다.")
  public boolean isConfirmNewPassword() {
    return this.newPassword.equals(this.confirmNewPassword);
  }

  public static User from(SocialUser socialUser) {
    User user = new User();

    user.setAttributes(socialUser.getAttributes());
    user.setEmail(socialUser.getEmail());
    user.setPassword(socialUser.getPassword());
    user.setName(socialUser.getName());
    user.setNickname("tmp@" + Instant.now().toEpochMilli());
    user.setRole(Role.ROLE_USER);
    user.setImageUrl(socialUser.getImageUrl());
    user.setLoginType(LoginType.SOCIAL);

    return user;
  }

  public void updateDetails(User user) {
    this.name = Objects.isNull(user.getName()) ? this.address1 : user.getName();
    this.nickname = Objects.isNull(user.getNickname()) ? this.address1 : user.getNickname();
    this.tel = Objects.isNull(user.getTel()) ? this.imageUrl : user.getTel();
    this.postcode = Objects.isNull(user.getPostcode()) ? this.address1 : user.getPostcode();
    this.address1 = Objects.isNull(user.getAddress1()) ? this.address1 : user.getAddress1();
    this.address2 = Objects.isNull(user.getAddress2()) ? this.address2 : user.getAddress2();
    this.imageUrl = Objects.isNull(user.getImageUrl()) ? this.imageUrl : user.getImageUrl();
    this.updatedAt = LocalDateTime.now();
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return Collections.singleton(new SimpleGrantedAuthority(this.role.name()));
  }

  @Override
  public String getUsername() {
    return this.email;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
