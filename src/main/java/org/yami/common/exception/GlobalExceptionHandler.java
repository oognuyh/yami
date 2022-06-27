package org.yami.common.exception;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yami.common.dto.MessageUtil;

@Slf4j
@ControllerAdvice
@RequiredArgsConstructor
public class GlobalExceptionHandler {

  private final ObjectMapper objectMapper;

  @ExceptionHandler({MethodArgumentNotValidException.class})
  public void handleMethodArgumentNotValidException(
      HttpServletRequest request, HttpServletResponse response, MethodArgumentNotValidException e)
      throws IOException {
    Map<String, String> fieldErrors =
        e.getBindingResult().getFieldErrors().stream()
            .collect(
                Collectors.toUnmodifiableMap(FieldError::getField, FieldError::getDefaultMessage));

    log.debug("Received an invalid request({})", fieldErrors);

    if (request.getContentType().equals(MediaType.APPLICATION_JSON_VALUE)) {
      PrintWriter out = response.getWriter();

      out.println(objectMapper.writeValueAsString(fieldErrors));
    } else {

    }
  }

  @ExceptionHandler({NoProductsToCheckOutException.class})
  public String handleNoProductsToCheckOutException(
      RedirectAttributes redirectAttributes, NoProductsToCheckOutException e) {
    log.debug("Someone requested checkout without products");

    redirectAttributes.addAllAttributes(MessageUtil.failure(e.getMessage()));

    return "redirect:/cart";
  }

  @ExceptionHandler({Exception.class})
  public String handleException(Exception e, Model model) {
    model.addAttribute("exception", e);

    return "error/index";
  }
}
