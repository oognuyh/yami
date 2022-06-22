package org.yami.order.service;

import org.springframework.web.servlet.ModelAndView;
import org.yami.order.dto.Order;

public interface CheckoutService {

	// 주문한 아이템 모델에 담는 메소드
	public void createOrder(ModelAndView mView);
	
	// 주문자 정보 세션에 로그인된 id값으로 가져와서 출력해주는 메소드
	//public Order getUserData(Order order);
}
