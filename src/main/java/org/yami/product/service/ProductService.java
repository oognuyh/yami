package org.yami.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.yami.product.dto.Product;

public interface ProductService {
	
	public void findProducts(HttpServletRequest request);
	public void findProduct(HttpServletRequest request);   	    
}
