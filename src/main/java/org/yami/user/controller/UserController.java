package org.yami.user.controller;

import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yami.common.dto.MessageUtil;
import org.yami.common.security.SecurityUtil;
import org.yami.common.validation.ValidationGroup.DeleteUser;
import org.yami.common.validation.ValidationGroup.RegisterUser;
import org.yami.common.validation.ValidationGroup.UpdatePassword;
import org.yami.common.validation.ValidationGroup.UpdateUserDetails;
import org.yami.user.dto.User;
import org.yami.user.service.UserService;

@Controller
@RequiredArgsConstructor
public class UserController {

  private final UserService userService;

  @GetMapping("/login")
  public String login(
      HttpServletRequest request, Model model, Optional<String> type, Optional<String> message) {
    if (request.getParameterMap().containsKey("error")) {
      model.addAllAttributes(MessageUtil.failure("아이디 또는 비밀번호가 유효하지 않습니다."));
    }

    return "user/login";
  }

  @GetMapping("/register")
  public String register() {
    return "user/register";
  }

  @GetMapping({"/profile", "/profile/details"})
  public String profile(Model model) {

    model.addAttribute(
        "user", userService.findUserByUserId(SecurityUtil.getCurrentLoggedInUser().getUserId()));

    return "user/profile/details";
  }

  @GetMapping("/profile/password")
  public String passowrd() {
    return "user/profile/password";
  }

  @GetMapping("/profile/delete")
  public String delete() {
    return "user/profile/delete";
  }

  @PostMapping("/register")
  public String register(
      @Validated(RegisterUser.class) @RequestBody User user,
      RedirectAttributes redirectAttributes) {
    userService.register(user);

    redirectAttributes.addAllAttributes(MessageUtil.success("회원가입이 완료되었습니다."));

    return "redirect:/login";
  }

  @PostMapping("/profile/details")
  public String updateLoggedInUserDetails(
      @Validated(UpdateUserDetails.class) @RequestBody User user,
      RedirectAttributes redirectAttributes) {
    userService.updateUserDetails(user);

    return "redirect:/profile/details";
  }

  @PostMapping("/profile/password")
  public String changeLoggedInUserPassword(
      @Validated(UpdatePassword.class) @RequestBody User user,
      RedirectAttributes redirectAttributes) {
    userService.changePassword(user);

    redirectAttributes.addAllAttributes(MessageUtil.success("성공적으로 변경되었습니다."));

    return "redirect:/profile/password";
  }

  @PostMapping("/profile/delete")
  public String deleteLoggedInUser(
      @Validated(DeleteUser.class) @RequestBody User user, RedirectAttributes redirectAttributes) {
    userService.deleteUser(SecurityUtil.getCurrentLoggedInUser());

    redirectAttributes.addAllAttributes(MessageUtil.success("성공적으로 탈퇴되었습니다."));

    return "redirect:/login";
  }
}
