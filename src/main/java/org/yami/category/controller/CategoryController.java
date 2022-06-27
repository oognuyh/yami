package org.yami.category.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yami.category.dto.Category;
import org.yami.category.service.CategoryService;

@Controller
@RequiredArgsConstructor
public class CategoryController {

  private final CategoryService categoryService;

  @GetMapping("/api/categories")
  @ResponseBody
  public List<Category> findAllCategories() {
    return categoryService.findAllCategories();
  }
}
