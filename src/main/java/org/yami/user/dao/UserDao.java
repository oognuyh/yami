package org.yami.user.dao;

import java.util.Optional;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.yami.user.dto.LoginType;
import org.yami.user.dto.User;

@Mapper
public interface UserDao {

  @Select("SELECT * FROM users WHERE user_id = #{userId}")
  @ResultMap("UserMapper.userMap")
  Optional<User> findUserByUserId(@Param("userId") String userId);

  @Select("SELECT * FROM users WHERE email = #{email} AND login_type = #{loginType}")
  @ResultMap("UserMapper.userMap")
  Optional<User> findUserByEmailAndLoginType(
      @Param("email") String email, @Param("loginType") LoginType loginType);

  @Select(
      "SELECT "
          + "CASE WHEN COUNT(email) > 0 THEN 1 "
          + "ELSE 0 END result "
          + "FROM users "
          + "WHERE email = #{email}")
  boolean existsUserByEmail(@Param("email") String email);

  @Select(
      "SELECT "
          + "CASE WHEN COUNT(nickname) > 0 THEN 1 "
          + "ELSE 0 END result "
          + "FROM users "
          + "WHERE nickname = #{nickname}")
  boolean existsUserByNickname(@Param("nickname") String nickname);

  @Insert(
      "INSERT INTO users(user_id, email, password, name, nickname, postcode, address1, address2,"
          + " login_type) VALUES(#{userId}, #{email}, #{password}, #{name}, #{nickname},"
          + " #{postcode}, #{address1}, #{address2}, #{loginType})")
  int saveUser(User user);

  @Update(
      "UPDATE users SET "
          + "name = #{name}, "
          + "nickname = #{nickname}, "
          + "postcode = #{postcode}, "
          + "address1 = #{address1}, "
          + "address2 = #{address2} "
          + "WHERE user_id = #{userId}")
  int updateUserDetails(User user);

  @Update("UPDATE users SET " + "password = #{password} " + "WHERE user_id = #{userId}")
  int updatePassword(User user);

  @Delete("DELETE FROM users WHERE user_id = #{userId}")
  int deleteUserByUserId(@Param("userId") String userId);
}
