package org.yami.product.service;


import org.springframework.web.servlet.ModelAndView;

public interface ProductService {

	public void getList(String categoryId, ModelAndView mView);
	
	public void findProducts(String find, ModelAndView mView);
	
}
