package org.yami.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yami.cart.dao.CartDao;
import org.yami.cart.dto.CartItem;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao dao;
	@Override
	public int insert(CartItem cart) {
		return 0;
	}

	@Override
	public List<CartItem> getList(String userId) {
		return null;
	}

	@Override
	public int update(CartItem cart) {

		return dao.update(cart);
	}

	@Override
	public int delete(String cartItemId) {
		return dao.delete(cartItemId);
	}

}
