package org.yami.product.dao;

import java.util.List;

import org.yami.product.dto.Product;

public interface ProductDao {
 
    List<Product> findProducts();
}
