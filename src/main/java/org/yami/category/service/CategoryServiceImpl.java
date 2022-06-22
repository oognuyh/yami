package org.yami.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yami.category.dao.CategoryDao;
import org.yami.category.dto.Category;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired private CategoryDao categoryDao;

	@Override
	public List<Category> findAllCategories() {
		
		return categoryDao.findAllCategories();
	}
}
