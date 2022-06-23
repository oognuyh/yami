package org.yami.product.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.yami.product.dao.ProductDao;
import org.yami.product.dto.Product;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import java.net.URLEncoder;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	private final ProductDao productDao;

	@Override
	public void getList(String categoryId, ModelAndView mView) {
		PageInfo<Product> page = PageHelper.startPage(1, 20)
				.doSelectPageInfo(() -> {
					var products = productDao.getList(categoryId);
					
					log.info("service products -> {}", products);
				});
		
		log.info("page -> {}", page);
		
		mView.addObject("page", page);
	}
	
	@Override
	public  void findProducts(HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		int pageSize = Integer.valueOf(Optional.ofNullable(request.getParameter("pageSize"))
				.orElse("10"));
		int pageNum = Integer.valueOf(Optional.ofNullable(request.getParameter("pageNum"))
				.orElse("1"));
		
		if(keyword==null){ 
			keyword="";
		}
		
		String encodedK=URLEncoder.encode(keyword);
		Product product=new Product();
		
		if(!keyword.isBlank()){
			product.setName(keyword);
		}
		
		PageInfo<Product> page = PageHelper.startPage(pageNum, pageSize)
				.doSelectPageInfo(() -> productDao.findProducts(product));
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("page", page);
	}

	@Override
	public void findProduct(HttpServletRequest request) {
		
		String productId=request.getParameter("productId");
		Product productDto = productDao.findProduct(productId);
		request.setAttribute("product", productDto);
		
	}

}
