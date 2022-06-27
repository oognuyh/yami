package org.yami.order.dao;

import java.util.Collections;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;
import org.yami.payment.dto.Payment;

@Repository
@RequiredArgsConstructor
public class OrderDaoImpl implements OrderDao {

  private final SqlSession session;

  @Override
  public List<Order> findOrdersByUserId(String userId) {
    return session.selectList(
        "OrderMapper.findOrdersByUserId", Collections.singletonMap("userId", userId));
  }

  @Override
  public List<OrderItem> findOrderItems(List<OrderItem> orderItems) {
    return session.selectList(
        "OrderMapper.findOrderItems", Collections.singletonMap("orderItems", orderItems));
  }

  @Override
  public Payment findBuyerByUserId(String userId) {
    return session.selectOne("OrderMapper.findBuyerByUserId", userId);
  }

  @Override
  public int saveOrder(Order order) {
    return session.insert("OrderMapper.saveOrder", order);
  }

  @Override
  public int saveOrderItem(OrderItem orderItem) {
    return session.insert("OrderMapper.saveOrderItem", orderItem);
  }
}
