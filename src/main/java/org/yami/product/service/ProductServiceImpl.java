package org.yami.product.service;

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
	public List<Product> findProducts() {
		return productDao.findProducts();
	}

	@Override
	public void findProduct(HttpServletRequest request) {
		
		String productId=request.getParameter("productId");
		Product productDto = productDao.findProduct(productId);
		request.setAttribute("product", productDto);
		
	}

}
