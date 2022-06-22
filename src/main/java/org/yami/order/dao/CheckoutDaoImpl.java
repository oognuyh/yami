package org.yami.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.yami.order.dto.OrderItem;
import org.yami.payment.dto.Payment;

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
	public Payment getBuyerByUserId(String userId) {
		return session.selectOne("OrderMapper.findBuyerByUserId", userId);
	}	
}
