package org.yami.common.configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.github.pagehelper.PageInterceptor;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableTransactionManagement
@MapperScan(basePackages = "org.yami.*.dao", annotationClass = Mapper.class)
public class DatabaseConfig {

  private final DataSource dataSource;

  @Bean
  public PlatformTransactionManager transactionManager() {
    return new DataSourceTransactionManager(dataSource);
  }

  @Bean
  public SqlSessionFactory sqlSessionFactory() throws Exception {
    SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    PageInterceptor pageInterceptor = new PageInterceptor();
    Properties configurationProps = new Properties();
    Properties pageHelperProps = new Properties();

    sqlSessionFactoryBean.setMapperLocations(
        new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml"));
    sqlSessionFactoryBean.setPlugins();
  
    configurationProps.setProperty("mapUnderscoreToCamelCase", "true");
    configurationProps.setProperty("jdbcTypeForNull", "NULL");
    configurationProps.setProperty("callSettersOnNulls", "false");

    pageHelperProps.setProperty("helperDialect", "oracle9i");
    pageHelperProps.setProperty("reasonable", "true");

    pageInterceptor.setProperties(pageHelperProps);

    sqlSessionFactoryBean.setPlugins(pageInterceptor);
    sqlSessionFactoryBean.setConfigurationProperties(configurationProps);
    sqlSessionFactoryBean.setTypeAliasesPackage("org.yami.*.dto");
    sqlSessionFactoryBean.setDataSource(dataSource);

    return sqlSessionFactoryBean.getObject();
  }

  @Bean
  public SqlSessionTemplate sqlSessionTemplate() throws Exception {
    return new SqlSessionTemplate(sqlSessionFactory());
  }
}
