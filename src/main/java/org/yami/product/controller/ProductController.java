package org.yami.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/product/list")
	public ModelAndView list(@RequestParam("categoryId") String categoryId, ModelAndView mView) {
		
		ProductService.getList(categoryId, mView);
		mView.setViewName("product/list");
		return mView;
    }
}
