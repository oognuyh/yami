package org.yami.product.dao;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.yami.product.dto.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

  @Autowired private SqlSession sqlSession;

  @Override
  @Transactional(readOnly = true)
  public List<Product> findProducts() {
    return sqlSession.selectList("ProductMapper.findProducts");
  }

  @Transactional(readOnly = true)
  public List<Product> findProducts(String q, String categoryId) {
    return sqlSession.selectList(
        "ProductMapper.findProducts",
        Map.of("q", q, "categoryId", Objects.isNull(categoryId) ? "" : categoryId));
  }

  @Override
  @Transactional
  public int saveProduct(Product product) {
    return sqlSession.insert("ProductMapper.saveProduct", product);
  }

  @Override
  public Optional<Product> findProductByProductId(String productId) {
    return Optional.ofNullable(
        sqlSession.selectOne("ProductMapper.findProductByProductId", productId));
  }
}
