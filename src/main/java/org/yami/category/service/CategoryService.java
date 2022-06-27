package org.yami.category.service;

import java.util.List;
import org.yami.category.dto.Category;

public interface CategoryService {

  List<Category> findAllCategories();
}
