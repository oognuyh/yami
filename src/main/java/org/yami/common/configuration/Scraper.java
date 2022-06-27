package org.yami.common.configuration;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.yami.image.dao.ImageDao;
import org.yami.image.dto.Image;
import org.yami.product.dao.ProductDao;
import org.yami.product.dto.Product;

@Slf4j
@Configuration
@Profile("scrape")
@RequiredArgsConstructor
public class Scraper {

  private final ProductDao productDao;

  private final ImageDao imageDao;

  private final List<String> categories = List.of("017", "014", "021", "030", "023", "027");

  private final Map<String, String> categoryIds =
      Map.of(
          "017", "26275020-ea3c-11ec-8fea-0242ac120002",
          "014", "d1ee2312-ee05-11ec-8ea0-0242ac120002",
          "021", "51d25c06-ee06-11ec-8ea0-0242ac120002",
          "030", "572c44eb-6505-4377-8c14-dd90204ffea6",
          "023", "3d721069-93d2-4529-80f3-bc9a920f359c",
          "027", "6d75573b-a43c-42c5-ac77-83c7e26c02d0");

  class ProductWrapper {

    public Product product;

    public String detailsLink;
  }

  @PostConstruct
  public void scrape() {
    log.info("Scrape products from mychef.kr");

    WebDriver webDriver = new FirefoxDriver();
    List<ProductWrapper> productWrappers = new ArrayList<>();

    for (String category : categories) {
      int page = 1;

      while (true) {
        webDriver.get(
            String.format(
                "https://www.mychef.kr/goods/goods_list.php?page=%d&cateCd=%s&sort=&pageNum=100",
                page, category));

        webDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

        log.debug("Current URL - {}", webDriver.getCurrentUrl());

        List<WebElement> productElements = webDriver.findElements(By.className("btn_add_wish_"));
        if (productElements.isEmpty()) {
          log.debug("No product found");
          break;
        }

        for (WebElement productElement : productElements) {
          String name = productElement.getAttribute("data-goods-nm");
          String imageUrl = productElement.getAttribute("data-goods-image-src");
          String productNo = productElement.getAttribute("data-goods-no");

          ProductWrapper productWrapper = new ProductWrapper();
          Product product = new Product();

          product.setName(name);
          product.setImageUrl(imageUrl);
          product.setCategoryId(categoryIds.get(category));

          productWrapper.product = product;
          productWrapper.detailsLink =
              String.format("https://www.mychef.kr/goods/goods_view.php?goodsNo=%s", productNo);

          productWrappers.add(productWrapper);
        }

        page++;
        log.debug("Move to the next page({})", page);
      }
      log.debug("Category({}) has been completed", category);
    }

    log.debug("Found all products");

    for (ProductWrapper productWrapper : productWrappers) {
      webDriver.get(productWrapper.detailsLink);

      webDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

      List<WebElement> imageElements =
          webDriver.findElement(By.className("txt-manual")).findElements(By.tagName("img"));

      log.debug("Found {} images of {}", imageElements.size(), productWrapper.product.getName());

      if (webDriver
          .findElement(By.xpath("//*[@class=\"item_detail_list\"]/dl[1]/dt"))
          .getText()
          .equals("짧은설명")) {
        String summary =
            webDriver.findElement(By.xpath("//*[@class=\"item_detail_list\"]/dl[1]/dd")).getText();

        productWrapper.product.setSummary(summary);

        log.debug("Found the summary({})", summary);
      }

      int price =
          (int)
              Double.parseDouble(
                  webDriver.findElement(By.id("set_goods_fixedPrice")).getAttribute("value"));

      log.debug("Found the price({})", price);

      productWrapper.product.setPrice(price);

      productDao.saveProduct(productWrapper.product);

      log.debug("{} has been successfully saved into the database", productWrapper.product);

      for (var imageElement : imageElements) {
        String imageUrl = imageElement.getAttribute("src");
        Image image = new Image();

        image.setPath(imageUrl);
        image.setTargetId(productWrapper.product.getProductId());

        productWrapper.product.getContent().add(image);

        imageDao.saveImage(image);

        log.debug("{} has been uccessfully saved into the database", image.getImageId());
      }
    }

    log.debug("All products({}) have been successfully completed", productWrappers.size());
  }
}
