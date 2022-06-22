package org.yami.order.dao;

import java.util.List;

import org.yami.order.dto.OrderItem;
import org.yami.payment.dto.Payment;

public interface CheckoutDao {
	
	// 주문내역을 불러오는 메소드
	public List<OrderItem> getOrderItems(String userId);
	
	// 주문자 정보 세션에 로그인된 id값으로 가져와서 출력해주는 메소드
	public Payment getBuyerByUserId(String userId); 	
}
