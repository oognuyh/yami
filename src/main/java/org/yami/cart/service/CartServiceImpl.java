package org.yami.cart.service;

import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yami.cart.dao.CartDao;
import org.yami.cart.dto.CartItem;

@Slf4j
@Service("cartService")
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

  private final CartDao cartDao;

  @Override
  public List<CartItem> findCartItemsByUserId(String userId) {
    log.debug("Find all cart items user({}) have", userId);

    return cartDao.findCartItemsByUserId(userId);
  }

  @Override
  @Transactional
  public void addCartItem(CartItem cartItem) {
    log.debug("Add a cart item to user({})'s cart", cartItem.getUserId());

    Optional<CartItem> cartItemWrapper =
        cartDao.findCartItemByUserIdAndProductId(cartItem.getUserId(), cartItem.getProductId());
    if (cartItemWrapper.isPresent()) {
      CartItem existingCartItem = cartItemWrapper.get();

      log.debug("Found the existing ({})", existingCartItem);

      existingCartItem.setQuantity(existingCartItem.getQuantity() + cartItem.getQuantity());

      cartDao.updateCartItem(existingCartItem);

      log.debug("The quantity of the existing cart item has been successfully increased");
    } else {
      log.debug("Add new cart item({})", cartItem);

      cartDao.saveCartItem(cartItem);

      log.debug("The cart item has been successfully saved");
    }
  }

  @Override
  @Transactional
  public void updateCartItem(CartItem cartItem) {
    log.debug("Update the existing cart item to {}", cartItem);

    cartDao.updateCartItem(cartItem);

    log.debug("The cart item has been successfully updated");
  }

  @Override
  public void deleteCartItemsByCartItemIds(List<String> cartItemIds) {
    log.debug("Delete multiple cart items with ids {}", cartItemIds);

    cartDao.deleteCartItemsByCartItemIds(cartItemIds);

    log.debug("The cart items have been successfully deleted");
  }
}
