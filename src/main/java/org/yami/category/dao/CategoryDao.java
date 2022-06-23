package org.yami.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.yami.category.dto.Category;

@Mapper
public interface CategoryDao {

	@Select("SELECT * FROM categories")
	List<Category> findAllCategories();
}
