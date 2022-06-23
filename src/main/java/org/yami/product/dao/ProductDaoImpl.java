package org.yami.product.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.yami.product.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductDaoImpl implements ProductDao {


    @Autowired 
    private SqlSession sqlSession;

	@Override
	public List<Product> getList(String categoryId) {
		List<Product> products = sqlSession.selectList("ProductMapper.getList", categoryId);
		
		log.info("products -> {}", products);
		
		return products;
	}

    @Override
    @Transactional(readOnly = true)
    public List<Product> findProducts(Product product) {
        return sqlSession.selectList("ProductMapper.findProducts",product);
    }

	@Override
	public Product findProduct(String productId) {

		return sqlSession.selectOne("ProductMapper.findProduct",productId);
	}

}
