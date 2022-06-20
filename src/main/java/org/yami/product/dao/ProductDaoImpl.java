package org.yami.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.yami.product.dto.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired 
    private SqlSession Sqlsession;

	@Override
	public List<Product> getList() {
		return Sqlsession.selectList("ProductMapper.getList");
	}

	@Override
	public List<Product> findProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> CategoryProduct() {
		// TODO Auto-generated method stub
		return null;
	}
}
