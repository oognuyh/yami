package org.yami.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.yami.product.dao.ProductDao;
import org.yami.product.dto.Product;

@Service
public class ProductService {
    
	@Autowired
    private ProductDao Productdao;

	public void getList(ModelAndView mView) {
		//상품 목록
		List<Product> list=Productdao.getList();
		//ModelAndView  객체에 list 라는 키값으로 담는다.
		mView.addObject("list", list);
	}

}
