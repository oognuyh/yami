package org.yami.product.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.yami.product.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProductController {
    
    private final ProductService productService;

    @GetMapping
    public String home(HttpServletRequest request ) {

        productService.findProducts(request);

        return "home/index";
    }
    
    @RequestMapping("/proudct/list")
    public String searchList(HttpServletRequest request) {
    	productService.findProducts(request);
 
    	return "product/list";
    }
    
    @RequestMapping("/product/detail")
    public String detail(HttpServletRequest request) {
    	productService.findProduct(request);
    	
    	return "product/detail";
    }
}
