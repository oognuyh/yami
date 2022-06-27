package org.yami.product.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.yami.common.dto.Criteria;
import org.yami.product.dao.ProductDao;
import org.yami.product.dto.Product;

@Service
@RequiredArgsConstructor
public class ProductService {

  private final ProductDao productDao;

  public PageInfo<Product> findProducts(Criteria criteria, String categoryId) {
    return PageHelper.startPage(criteria.getPageNum(), criteria.getPageSize())
        .doSelectPageInfo(() -> productDao.findProducts(criteria.getQ(), categoryId));
  }

  public Product findProductByProductId(String productId) {
    return productDao.findProductByProductId(productId).orElseThrow();
  }
}
