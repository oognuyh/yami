package org.yami.cart.service;

import java.util.List;

import org.yami.cart.dto.CartItem;

public interface CartService {
	//추가
	public int insert(CartItem cart);
	//목록
	public List<CartItem> getList(String userId);
	//수량 수정
	public int update(CartItem cart);
	//삭제
	public int delete(String cartItemId);
}
