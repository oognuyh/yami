package org.yami.order.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import org.yami.order.dao.CheckoutDao;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;


@Service
public class CheckoutServiceImpl implements CheckoutService {

	@Autowired
	private CheckoutDao dao;

	@Override
	public void createOrder(ModelAndView mView) {
		// 번호로 얻어온 할일 정보 하나를 dto에 담고
		String userId = "d1ee2312-ee05-11ec-8ea0-0242ac120002";
		String orderId = "41c60ad4-0042-406b-915e-7f2668751990";
		List<OrderItem> orderItems = dao.getOrderItems(userId);

		Order order = new Order();
		
		order.setOrderId(orderId);
		order.setUserId(userId);
		order.setOrderItems(orderItems);
		order.setTotalPrice(orderItems.stream()
				.map((orderItem) -> orderItem.getQuantity() * orderItem.getProductPrice())
				.mapToInt(Integer::intValue)
				.sum());
		
		// 그걸 mView객체에 담기
		mView.addObject("order", order);
		
	}

	@Override
	public Order getUserData(Order order, HttpSession session) {
		
		// 세션에 저장되어 있는 id값을 불러와서
		String id = (String)session.getAttribute("id");
		// 그 값으로 DB에서 가져온 정보를 dto에 담고 출력
		dao.get
		order.setUserId(userId);
		
		return null;
	}
	
	
	
}
