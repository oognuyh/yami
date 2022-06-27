package org.yami.order.controller;

import java.util.ArrayList;
import java.util.Objects;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yami.common.dto.Criteria;
import org.yami.common.dto.MessageUtil;
import org.yami.common.exception.NoProductsToCheckOutException;
import org.yami.common.security.SecurityUtil;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;
import org.yami.order.service.OrderService;

@Controller
@RequiredArgsConstructor
public class OrderController {

  private final OrderService orderService;

  @GetMapping("/order/checkout")
  public String checkout(
      Model model, @SessionAttribute(value = "temporalOrder", required = false) Order order) {
    if (Objects.isNull(order) || order.getOrderItems().isEmpty())
      throw new NoProductsToCheckOutException();

    order.setUserId(SecurityUtil.getCurrentLoggedInUser().getUserId());
    order.setPayment(orderService.findBuyerByUserId(order.getUserId()));
    model.addAttribute("order", order);

    return "order/checkout";
  }

  @PostMapping("/order/checkout")
  public String checkout(@RequestBody ArrayList<OrderItem> orderItems, HttpSession session) {
    if (orderItems.isEmpty()) {
      throw new NoProductsToCheckOutException();
    }

    session.setMaxInactiveInterval(60 * 60);
    session.setAttribute("temporalOrder", orderService.createTemporalOrder(orderItems));

    return "redirect:/order/checkout";
  }

  @PostMapping("/order/complete")
  public String complete(@RequestBody Order order, RedirectAttributes redirectAttributes) {
    order.setUserId(SecurityUtil.getCurrentLoggedInUser().getUserId());

    orderService.completeOrder(order);

    redirectAttributes.addAllAttributes(MessageUtil.success("주문이 완료되었습니다."));

    return "redirect:/order/history";
  }

  @GetMapping("/order/history")
  public String history(Model model, Criteria criteria) {
    model.addAttribute(
        "page",
        orderService.findOrdersByUserId(
            SecurityUtil.getCurrentLoggedInUser().getUserId(), criteria));

    return "order/history";
  }
}
