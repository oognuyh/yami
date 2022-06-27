package org.yami.payment.dao;

import java.util.Map;
import org.yami.payment.dto.Payment;

public interface IamportDao {

  String getAccessToken() throws Exception;

  Map<String, Object> getActualPayment(String accessToken, Payment payment) throws Exception;
}
