package org.yami.product.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.yami.common.annotation.JsonDateFormat;
import org.yami.image.dto.Image;

@Data
@Alias("Product")
public class Product {
  // 상품 고유번호
  private String productId = UUID.randomUUID().toString();
  // 카테고리 고유번호
  private String categoryId;
  // 이름
  private String name;
  // 가격
  private int price;
  // 요약 설명
  private String summary;
  // 이미지 주소
  private String imageUrl;
  // 생성일자
  @JsonDateFormat private LocalDateTime createdAt;
  // 수정일자
  @JsonDateFormat private LocalDateTime updatedAt;
  // 카테고리 이름
  private String categoryName;
  // 이미지 설명 목록
  private List<Image> content = new ArrayList<>();
}
