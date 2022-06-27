package org.yami.product.dao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.yami.common.configuration.DataSourceConfig;
import org.yami.common.configuration.DatabaseConfig;
import org.yami.product.dto.Product;

@ActiveProfiles("test")
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
    classes = {DatabaseConfig.class, DataSourceConfig.class, ProductDaoImpl.class})
public class ProductDaoTest {

  @Autowired private ProductDao productDao;

  @Test
  public void should_return_valid_page_class_when_find_products() {
    // given
    int page = 1;
    int size = 20;

    // when
    PageInfo<Product> actual =
        PageHelper.startPage(page, size).doSelectPageInfo(() -> productDao.findProducts());

    // then
    Assertions.assertAll(
        () -> Assertions.assertEquals(size, actual.getPageSize()),
        () -> Assertions.assertEquals(page, actual.getPageNum()));
  }
}
