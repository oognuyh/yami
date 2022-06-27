package org.yami.order.dao;

import java.util.List;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;
import org.yami.payment.dto.Payment;

public interface OrderDao {

  List<Order> findOrdersByUserId(String userId);

  List<OrderItem> findOrderItems(List<OrderItem> orderItems);

  Payment findBuyerByUserId(String userId);

  int saveOrder(Order order);

  int saveOrderItem(OrderItem orderItem);
}
