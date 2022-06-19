package org.yami.image.dto;

import java.time.LocalDateTime;
import java.util.UUID;

import org.apache.ibatis.type.Alias;
import org.yami.common.annotation.JsonDateFormat;

import lombok.Data;

@Data
@Alias("Image")
public class Image {
  // 이미지 고유번호
  private String imageId = UUID.randomUUID().toString();
  // 대상 고유번호
  private String targetId;
  // 경로
  private String path;
  // 생성일자
  @JsonDateFormat
  private LocalDateTime createdAt;
  // 수정일자
  @JsonDateFormat
  private LocalDateTime updatedAt;
}
