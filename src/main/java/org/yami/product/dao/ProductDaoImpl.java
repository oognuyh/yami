package org.yami.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.yami.product.dto.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired 
    private SqlSession sqlSession;

	@Override
	public List<Product> getList(String categoryId) {
		return sqlSession.selectList("ProductMapper.getList", categoryId);
	}

	@Override
	public List<Product> findProducts(String find) {
		return sqlSession.selectList("ProductMapper.findProducts", find);
	}

	@Override
	public List<Product> CategoryProduct() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveProduct(Product product) {
		return sqlSession.insert("ProductMapper.saveProduct", product);
	}
}
