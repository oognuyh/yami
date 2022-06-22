package org.yami.product.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.yami.product.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProductController {
    
    private final ProductService productService;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("time", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
        model.addAttribute("products", productService.findProducts());

        return "home/index";
    }
    
    @RequestMapping("/product/detail")
    public String detail(HttpServletRequest request) {
    	
    	productService.findProduct(request);
    	return "product/detail";
    }
}
