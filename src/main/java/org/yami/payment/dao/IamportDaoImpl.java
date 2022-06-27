package org.yami.payment.dao;

import java.net.URL;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;
import org.yami.payment.dto.Payment;

@Slf4j
@Repository
@RequiredArgsConstructor
public class IamportDaoImpl implements IamportDao {

  private final RestTemplate restTemplate;

  @Value("${iamport.key}")
  private String IAMPORT_KEY;

  @Value("${iamport.secret}")
  private String IAMPORT_SECRET;

  @Override
  @SuppressWarnings("unchecked")
  public String getAccessToken() throws Exception {
    RequestEntity<Map<String, String>> request =
        RequestEntity.post(new URL("https://api.iamport.kr/users/getToken").toURI())
            .contentType(MediaType.APPLICATION_JSON)
            .body(Map.of("imp_key", IAMPORT_KEY, "imp_secret", IAMPORT_SECRET));
    ParameterizedTypeReference<Map<String, Object>> responseType =
        new ParameterizedTypeReference<Map<String, Object>>() {};
    ResponseEntity<Map<String, Object>> response = restTemplate.exchange(request, responseType);

    log.debug("Received {} from iamport", response.getBody());

    return (String) ((Map<String, String>) response.getBody().get("response")).get("access_token");
  }

  @Override
  @SuppressWarnings("unchecked")
  public Map<String, Object> getActualPayment(String accessToken, Payment payment)
      throws Exception {
    RequestEntity<Void> request =
        RequestEntity.get(new URL("https://api.iamport.kr/payments/" + payment.getImpUid()).toURI())
            .headers(
                (header) -> {
                  header.add(HttpHeaders.AUTHORIZATION, accessToken);
                })
            .build();
    ParameterizedTypeReference<Map<String, Object>> responseType =
        new ParameterizedTypeReference<Map<String, Object>>() {};
    ResponseEntity<Map<String, Object>> response = restTemplate.exchange(request, responseType);

    log.debug("Received {} from iamport", response.getBody());

    return (Map<String, Object>) response.getBody().get("response");
  }
}
