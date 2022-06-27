package org.yami.payment.service;

import org.yami.payment.dto.Payment;

public interface PaymentService {

  Payment savePaymentIfValid(Payment payment);
}
