package org.yami.category.dto;

import java.time.LocalDateTime;
import java.util.UUID;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.yami.common.annotation.JsonDateFormat;

@Data
@Alias("Category")
public class Category {
  // 카테고리 고유번호
  private String categoryId = UUID.randomUUID().toString();
  // 이름
  private String name;
  // 생성일자
  @JsonDateFormat private LocalDateTime createdAt;
  // 수정일자
  @JsonDateFormat private LocalDateTime updatedAt;
}
