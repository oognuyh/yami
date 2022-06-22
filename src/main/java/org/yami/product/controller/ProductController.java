package org.yami.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.yami.product.service.ProductService;

@Controller
public class ProductController {

	@Autowired 
	private ProductService ProductService;
	
	@GetMapping
	public String home() {
		
		return "home/index";
	}
	
	// 카테고리별 상품 목록 불러오기
	@RequestMapping("/product/list")
	public ModelAndView list(@RequestParam("categoryId") String categoryId, ModelAndView mView) {

		ProductService.getList(categoryId, mView);
		mView.setViewName("product/list");
		return mView;
    }
	
	// 검색 결과에 따른 상품 목록 불러오기
	@RequestMapping("/product/list/seach")
	public ModelAndView search(@RequestParam("find") String find, ModelAndView mView) {
		
		ProductService.findProducts(find, mView);;
		mView.addObject("find", find);
		mView.setViewName("product/list");
		return mView;

		
	}

	
	
	
	
}
