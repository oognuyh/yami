package org.yami.product.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.yami.product.dto.Product;

public interface ProductDao {
 
    public List<Product> findProducts(Product product);
    public Product findProduct(String productId);
}
