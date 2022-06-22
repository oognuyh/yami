package org.yami.product.dao;

import java.util.List;

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

	@Override
	public Product findProduct(String productId) {

		return sqlSession.selectOne("ProductMapper.findProduct",productId);
	}
}
