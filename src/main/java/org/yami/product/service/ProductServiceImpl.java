package org.yami.product.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.yami.product.dao.ProductDao;
import org.yami.product.dto.Product;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ProductServiceImpl implements ProductService {
    
	@Autowired
    private ProductDao productDao;

	public void getList(String categoryId, ModelAndView mView) {
		PageInfo<Product> page = PageHelper.startPage(1, 20)
				.doSelectPageInfo(() -> productDao.getList(categoryId));
		
		mView.addObject("page", page);
	}
	
	public void findProducts(String find, ModelAndView mView) {
		
		List<Product> list=productDao.findProducts(find);
		mView.addObject("list", list);
	}
	

}
