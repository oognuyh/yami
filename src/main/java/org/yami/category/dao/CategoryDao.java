package org.yami.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.yami.category.dto.Category;

@Mapper
public interface CategoryDao {

	@Select("SELECT * FROM categories")
	@Results({
		@Result(column = "category_id", property = "categoryId"),
		@Result(column = "name", property = "name"),
		@Result(column = "created_at", property = "createdAt"),
		@Result(column = "updated_at", property = "updatedAt")
	})
	List<Category> findAllCategories();
}
