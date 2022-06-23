package org.yami.product.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.yami.product.dao.ProductDao;
import org.yami.product.dto.Product;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	private final ProductDao productDao;

	@Override
	public  void findProducts(HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		
		if(keyword==null){ 
			keyword="";
		}
		
		String encodedK=URLEncoder.encode(keyword);
		Product product=new Product();
		
		if(!keyword.isBlank()){
			product.setName(keyword);
		}
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("products", productDao.findProducts(product));
	}

	@Override
	public void findProduct(HttpServletRequest request) {
		
		String productId=request.getParameter("productId");
		Product productDto = productDao.findProduct(productId);
		request.setAttribute("product", productDto);
		
	}

}
