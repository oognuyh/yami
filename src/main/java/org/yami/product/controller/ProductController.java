package org.yami.product.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.yami.common.dto.Criteria;
import org.yami.product.service.ProductService;

@Controller
@RequiredArgsConstructor
public class ProductController {

  private final ProductService productService;

  @GetMapping
  public String home(Model model) {
    model.addAttribute(
        "carouselItems",
        List.of(
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_92122.jpg",
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_86516.jpg",
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_67943.jpg",
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_62390.jpg",
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_81105.jpg",
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_59155.jpg",
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_96686.jpg",
            "https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/135007e7085979a7d5b41ce54c0e54d7_66392.jpg"));

    return "home/index";
  }

  @GetMapping("/product/list")
  public String list(Model model, String categoryId, String q, Criteria criteria) {
    model.addAttribute("page", productService.findProducts(criteria, categoryId));

    return "product/list";
  }

  @GetMapping("/product/details")
  public String details(Model model, @RequestParam String productId) {
    model.addAttribute("product", productService.findProductByProductId(productId));

    return "product/details";
  }
}
