package org.yami.category.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.yami.category.dto.Category;
import org.yami.category.service.CategoryService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CategoryController {
	
	private final CategoryService categoryService;

	@GetMapping("/api/categories")
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<Category> findAllCategories() {
		return categoryService.findAllCategories();
	}	
}
