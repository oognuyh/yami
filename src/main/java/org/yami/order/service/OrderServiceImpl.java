package org.yami.order.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import java.util.List;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.yami.common.dto.Criteria;
import org.yami.common.exception.ProductNotFoundException;
import org.yami.order.dao.OrderDao;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;
import org.yami.payment.dto.Payment;
import org.yami.product.dao.ProductDao;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

  private final OrderDao orderDao;

  private final ProductDao productDao;

  @Override
  @Transactional(readOnly = true)
  public Order createTemporalOrder(List<OrderItem> orderItems) {
    log.debug("Create a temporal order");

    Order order = new Order();
    order.setOrderItems(orderItems);
    order.getOrderItems().stream()
        .forEach(
            (orderItem) ->
                orderItem.setProduct(
                    productDao
                        .findProductByProductId(orderItem.getProductId())
                        .orElseThrow(ProductNotFoundException::new)));
    order.truncateName();
    order.calculateTotalPrice();

    log.debug("Save a temporal order into session");

    ServletRequestAttributes requestAttributes =
        (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    HttpSession session = requestAttributes.getRequest().getSession();

    session.setMaxInactiveInterval(60 * 60 * 2);
    session.setAttribute(order.getOrderId(), order);

    log.debug("The temporal order has been successfully saved.");

    return order;
  }

  @Override
  @Transactional(readOnly = true)
  public Payment findBuyerByUserId(String userId) {
    return orderDao.findBuyerByUserId(userId);
  }

  @Override
  @Transactional
  public void completeOrder(Order order) {
    ServletRequestAttributes requestAttributes =
        (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    HttpSession session = requestAttributes.getRequest().getSession();

    log.debug("Get the temporal order from session");

    Order existingOrder = (Order) session.getAttribute(order.getOrderId());

    log.debug("Save {} to the database", existingOrder);

    existingOrder.setUserId(order.getUserId());
    existingOrder.setRecipientEmail(order.getRecipientEmail());
    existingOrder.setRecipientName(order.getRecipientName());
    existingOrder.setRecipientTel(order.getRecipientTel());
    existingOrder.setRecipientPostcode(order.getRecipientPostcode());
    existingOrder.setRecipientAddress1(order.getRecipientAddress1());
    existingOrder.setRecipientAddress2(order.getRecipientAddress2());

    orderDao.saveOrder(existingOrder);

    existingOrder.getOrderItems().stream()
        .map(
            (orderItem) -> {
              orderItem.setOrderId(existingOrder.getOrderId());
              orderItem.setUserId(existingOrder.getUserId());

              return orderItem;
            })
        .forEach(orderDao::saveOrderItem);

    log.debug("Save {} to the database", existingOrder.getOrderItems());

    session.removeAttribute(order.getOrderId());

    log.debug("The temporal order has been successfully removed");
  }

  @Override
  public PageInfo<Order> findOrdersByUserId(String userId, Criteria criteria) {
    return PageHelper.startPage(criteria.getPageNum(), criteria.getPageSize())
        .doSelectPageInfo(() -> orderDao.findOrdersByUserId(userId));
  }
}
