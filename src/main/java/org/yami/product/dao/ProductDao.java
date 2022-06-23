package org.yami.product.dao;

import java.util.List;
import org.yami.product.dto.Product;

public interface ProductDao {

	
	// 상품 리스트
	public List<Product> getList(String categoryId);
    public List<Product> findProducts(Product product);
    public Product findProduct(String productId);
}
