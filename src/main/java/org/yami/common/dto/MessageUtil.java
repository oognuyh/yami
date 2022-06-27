package org.yami.common.dto;

import java.util.Map;

public class MessageUtil {

  public static Map<String, String> success(String message) {
    return Map.of("type", "success", "message", message);
  }

  public static Map<String, String> failure(String message) {
    return Map.of("type", "danger", "message", message);
  }
}
