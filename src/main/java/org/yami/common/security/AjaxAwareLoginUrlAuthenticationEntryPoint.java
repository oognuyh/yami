package org.yami.common.security;

import java.io.IOException;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

public class AjaxAwareLoginUrlAuthenticationEntryPoint extends LoginUrlAuthenticationEntryPoint {

  public AjaxAwareLoginUrlAuthenticationEntryPoint(String loginFormUrl) {
    super(loginFormUrl);
  }

  @Override
  public void commence(
      HttpServletRequest request,
      HttpServletResponse response,
      AuthenticationException authException)
      throws IOException, ServletException {
    if (!Objects.isNull(request.getContentType())
        && request.getContentType().equals(MediaType.APPLICATION_JSON_VALUE)) {
      HttpSession session = request.getSession();
      session.setAttribute("REDIRECT_TO_PREVIOUS", request.getHeader(HttpHeaders.REFERER));
      session.setMaxInactiveInterval(60 * 30);

      response.setContentType(MediaType.APPLICATION_JSON_VALUE);
      response.sendRedirect(request.getContextPath() + super.getLoginFormUrl());
    } else {
      super.commence(request, response, authException);
    }
  }
}
