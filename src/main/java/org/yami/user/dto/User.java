package org.yami.user.dto;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Collections;
import java.util.UUID;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.yami.common.annotation.JsonDateFormat;

import lombok.Data;

@Data
@Alias("Member")
public class User implements UserDetails {
  // 회원 고유번호
  private String memberId = UUID.randomUUID().toString();
  // 이름
  private String name;
  // 닉네임
  private String nickname;
  // 이메일
  private String email;
  // 비밀번호
  private String password;
  // 우편번호
  private String postcode;
  // 주소 1
  private String address1;
  // 주소 2
  private String address2;
  // 역할
  private Role role;
  // 생성일자
  @JsonDateFormat
  private LocalDateTime createdAt;
  // 수정일자
  @JsonDateFormat
  private LocalDateTime updatedAt;

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
      return Collections.singleton(new SimpleGrantedAuthority(this.role.name()));
  }

  @Override
  public String getUsername() {
      return this.email;
  }

  @Override
  public String getPassword() {
      return this.password;
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
