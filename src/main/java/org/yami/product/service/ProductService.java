package org.yami.product.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.yami.product.dao.ProductDao;
import org.yami.product.dto.Product;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
    
    private final ProductDao productDao;

    public List<Product> findProducts() {
        return productDao.findProducts().stream().peek(System.out::println).collect(Collectors.toList());
    }
}
