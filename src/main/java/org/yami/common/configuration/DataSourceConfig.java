package org.yami.common.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@PropertySource("classpath:application.properties")
public class DataSourceConfig {

  @Bean
  @Profile("!prod")
  public DataSource h2() {
    log.info("The application'll start using H2");

    return new EmbeddedDatabaseBuilder()
        .setType(EmbeddedDatabaseType.H2)
        .setName("testdb;MODE=Oracle")
        .generateUniqueName(false)
        .addDefaultScripts()
        .ignoreFailedDrops(false)
        .setScriptEncoding("UTF-8")
        .build();
  }

  @Bean
  @Profile("prod")
  public DataSource oracle(
      @Value("${spring.datasource.url}") String url,
      @Value("${spring.datasource.driver-class-name}") String driverClassName,
      @Value("${spring.datasource.username}") String username,
      @Value("${spring.datasource.password}") String password) {
    log.info("The application'll start using Oracle");

    HikariConfig configuration = new HikariConfig();

    configuration.setJdbcUrl(url);
    configuration.setDriverClassName(driverClassName);
    configuration.setUsername(username);
    configuration.setPassword(password);
    configuration.setAutoCommit(false);

    return new HikariDataSource(configuration);
  }
}