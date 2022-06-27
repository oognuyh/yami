package org.yami.payment.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yami.payment.dto.Payment;
import org.yami.payment.service.PaymentService;

@Controller
@RequiredArgsConstructor
public class PaymentController {

  private final PaymentService paymentService;

  @PostMapping("/payment/check")
  @ResponseBody
  public ResponseEntity<Payment> checkPayment(@RequestBody Payment payment) {
    return new ResponseEntity<>(paymentService.savePaymentIfValid(payment), HttpStatus.OK);
  }
}
