package org.yami.common.dto;

import lombok.Data;
import org.springframework.util.StringUtils;

@Data
public class Criteria {

  private String q;

  private int pageSize = 20;

  private int pageNum = 1;

  public int getPageSize() {
    return this.pageSize < 1 ? 1 : this.pageSize;
  }

  public int getPageNum() {
    return this.pageNum < 1 ? 1 : this.pageNum;
  }

  public String getQ() {
    return StringUtils.hasText(this.q) ? this.q : "";
  }
}
