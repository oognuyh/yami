package org.yami.product.dao;

import java.util.List;
import org.yami.product.dto.Product;

public interface ProductDao {
	
	// 상품 리스트
	public List<Product> getList(String categoryId);
	
	// 상품 검색
    public List<Product> findProducts(String find);
    
    // 카테고리별 
    public List<Product> CategoryProduct();

}
