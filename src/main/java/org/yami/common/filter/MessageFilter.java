package org.yami.common.filter;

import java.io.IOException;
import java.util.Optional;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MessageFilter implements Filter {

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {}

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    Optional.ofNullable(request.getParameter("type"))
        .ifPresent((value) -> request.setAttribute("type", value));
    Optional.ofNullable(request.getParameter("message"))
        .ifPresent((value) -> request.setAttribute("message", value));

    chain.doFilter(request, response);
  }

  @Override
  public void destroy() {}
}
