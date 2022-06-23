package org.yami.product.controller;


import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;
import org.yami.product.service.ProductServiceImpl;
import org.yami.product.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {

	@Autowired 
	private ProductServiceImpl productService;
	
    @GetMapping
    public String home(HttpServletRequest request ) {

        productService.findProducts(request);
        return "home/index";
    }

	// 카테고리별 상품 목록 불러오기
	@RequestMapping("/product/all")
	public ModelAndView list(@RequestParam("categoryId") String categoryId, ModelAndView mView) {
		productService.getList(categoryId, mView);
		mView.setViewName("product/list");
		return mView;
    }
		
    
    @RequestMapping("/proudct/list")
    public String searchList(HttpServletRequest request) {
    	productService.findProducts(request);
 
    	return "product/list";
    }
    
    @RequestMapping("/product/detail")
    public String detail(HttpServletRequest request) {
    	productService.findProduct(request);
    	
    	return "product/detail";
    }
}
