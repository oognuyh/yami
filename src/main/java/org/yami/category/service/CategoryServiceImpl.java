package org.yami.category.service;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.yami.category.dao.CategoryDao;
import org.yami.category.dto.Category;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

  private final CategoryDao categoryDao;

  @Override
  public List<Category> findAllCategories() {
    return categoryDao.findAllCategories();
  }
}
