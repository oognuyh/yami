package org.yami.common.configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

@Configuration
public class HttpConfig {

  @Bean
  public RestTemplate restTemplate() {
    return new RestTemplate(List.of(new MappingJackson2HttpMessageConverter(objectMapper())));
  }

  @Bean
  public ObjectMapper objectMapper() {
    return new Jackson2ObjectMapperBuilder().build();
  }
}
