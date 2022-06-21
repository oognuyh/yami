package org.yami.cart.dao;

import java.util.List;

import org.yami.cart.dto.CartItem;

public interface CartDao {
	//추가
	public int insert(CartItem cart);
	//삭제
	public int delete(String cartItemId);
	//수량 수정
	public int update(CartItem cart);
	//목록
	public List<CartItem> getList(String userId);
	//확인
	public CartItem checkCart(CartItem cart);
	//모두 제거
	public int deleteAll(CartItem cart);
}
