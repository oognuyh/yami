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
    private ProductDao ProductDao;

	public void getList(String categoryId, ModelAndView mView) {

		List<Product> list=ProductDao.getList(categoryId);
		mView.addObject("list", list);
	}
	
	public void findProducts(String find, ModelAndView mView) {
		
		List<Product> list=ProductDao.findProducts(find);
		mView.addObject("list", list);
	}
	

}
