package org.yami.product.service;



import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;


public interface ProductService {

	public void getList(String categoryId, ModelAndView mView);
	
	public void findProducts(HttpServletRequest request);
	public void findProduct(HttpServletRequest request);   	    
}
