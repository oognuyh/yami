package org.yami.payment.service;

import java.util.Map;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.yami.common.exception.PaymentForgeryException;
import org.yami.order.dto.Order;
import org.yami.payment.dao.IamportDao;
import org.yami.payment.dao.PaymentDao;
import org.yami.payment.dto.Payment;

@Slf4j
@RequiredArgsConstructor
@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

  private final PaymentDao paymentDao;

  private final IamportDao iamportDao;

  @Override
  @Transactional
  public Payment savePaymentIfValid(Payment payment) {
    try {
      Map<String, Object> actualPayment =
          iamportDao.getActualPayment(iamportDao.getAccessToken(), payment);

      log.debug("actual - {}", actualPayment);
      log.debug("payment - {}", payment);

      ServletRequestAttributes requestAttributes =
          (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
      HttpSession session = requestAttributes.getRequest().getSession();
      Order order = (Order) session.getAttribute(payment.getOrderId());

      int totalPrice = (Integer) actualPayment.getOrDefault("amount", -1);
      String orderId = (String) actualPayment.getOrDefault("merchant_uid", "UNKNOWN ORDER");
      if (order.getTotalPrice() == totalPrice && order.getOrderId().equals(orderId)) {
        paymentDao.savePayment(payment);

        return payment;
      } else {
        throw new PaymentForgeryException();
      }
    } catch (Exception e) {
      log.error("{}", e.getMessage());

      throw new RuntimeException("결제 서비스를 이용할 수 없습니다.");
    }
  }
}
