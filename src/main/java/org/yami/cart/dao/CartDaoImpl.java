package org.yami.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.yami.cart.dto.CartItem;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSession session;
	@Override
	public int insert(CartItem cart) {
		return session.insert("mapper.cart-mapper.insert", cart);
		
	}

	@Override
	public int delete(String cartItemId) {
		return session.delete("mapper.cart-mapper.delete", cartItemId );
	}

	@Override
	public int update(CartItem cart) {
		return session.update("mapper.cart-mapper.update", cart);
	}

	@Override
	public List<CartItem> getList(String userId) {
		return session.selectList("mapper.cart-mapper.getList", userId);
	}

	@Override
	public CartItem checkCart(CartItem cart) {
		return session.selectOne("mapper.cart-mapper.checkCart", cart);
	}

	@Override
	public int deleteAll(CartItem cart) {
		return session.selectOne("mapper.cart-mapper.deleteAll", cart);
	}

}
