package org.yami.order.service;

import com.github.pagehelper.PageInfo;
import java.util.List;
import org.yami.common.dto.Criteria;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;
import org.yami.payment.dto.Payment;

public interface OrderService {

  PageInfo<Order> findOrdersByUserId(String userId, Criteria criteria);

  Order createTemporalOrder(List<OrderItem> orderItems);

  Payment findBuyerByUserId(String userId);

  void completeOrder(Order order);
}
