package org.yami.common.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationSuccessHandlerImpl
    extends SavedRequestAwareAuthenticationSuccessHandler {

  public AuthenticationSuccessHandlerImpl() {}

  public AuthenticationSuccessHandlerImpl(String defaultTargetUri) {
    setDefaultTargetUrl(defaultTargetUri);
  }

  @Override
  public void onAuthenticationSuccess(
      HttpServletRequest request, HttpServletResponse response, Authentication authentication)
      throws IOException, ServletException {
    HttpSession session = request.getSession();
    if (session != null) {
      String previous = (String) session.getAttribute("REDIRECT_TO_PREVIOUS");

      if (previous != null) {
        session.removeAttribute("REDIRECT_TO_PREVIOUS");

        getRedirectStrategy().sendRedirect(request, response, previous);
      } else {
        super.onAuthenticationSuccess(request, response, authentication);
      }
    } else {
      super.onAuthenticationSuccess(request, response, authentication);
    }
  }
}
