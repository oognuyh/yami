package org.yami.product.dao;

import java.util.List;
import java.util.Optional;
import org.yami.product.dto.Product;

public interface ProductDao {

  List<Product> findProducts();

  List<Product> findProducts(String q, String categoryId);

  Optional<Product> findProductByProductId(String productId);

  int saveProduct(Product product);
}
