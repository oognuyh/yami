package org.yami.cart.service;

import java.util.List;
import org.yami.cart.dto.CartItem;

public interface CartService {

  List<CartItem> findCartItemsByUserId(String userId);

  void addCartItem(CartItem cartItem);

  void updateCartItem(CartItem cartItem);

  void deleteCartItemsByCartItemIds(List<String> cartItemIds);
}
