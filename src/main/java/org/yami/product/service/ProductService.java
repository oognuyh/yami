package org.yami.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.yami.product.dto.Product;

public interface ProductService {
	  
	List<Product> findProducts();
	public void findProduct(HttpServletRequest request);
	        
	   	    
}
