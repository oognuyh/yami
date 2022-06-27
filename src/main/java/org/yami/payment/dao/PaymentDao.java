package org.yami.payment.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.yami.payment.dto.Payment;

@Mapper
public interface PaymentDao {

  @Insert(
      "INSERT INTO payments(payment_id, order_id, imp_uid, pay_method, buyer_email, buyer_name,"
          + " buyer_tel, buyer_postcode, buyer_address1, buyer_address2, total_price, receipt_url)"
          + " VALUES(#{paymentId}, #{orderId}, #{impUid}, #{payMethod}, #{buyerEmail},"
          + " #{buyerName}, #{buyerTel}, #{buyerPostcode}, #{buyerAddress1}, #{buyerAddress2},"
          + " #{totalPrice}, #{receiptUrl})")
  int savePayment(Payment payment);
}
