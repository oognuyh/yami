package org.yami.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;

@Repository
public class CheckoutDaoImpl implements CheckoutDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<OrderItem> getOrderItems(String userId) {
		List<OrderItem> orderList = session.selectList("ProductMapper.OrderItems", userId);
		return orderList;
	}

	@Override
	public Order getUserData(Order order) {
		// 세션에 저장된 로그인중인 id값을 얻어와서
		//String id = (String)session.get
		// dto에 담기
		
		return null;
	}


	
	
}
