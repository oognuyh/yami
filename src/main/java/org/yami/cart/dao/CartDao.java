package org.yami.cart.dao;

import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.yami.cart.dto.CartItem;

@Mapper
public interface CartDao {

  @Select("SELECT * FROM cartitems WHERE user_id = #{userId}")
  @ResultMap("CartMapper.cartItemMap")
  List<CartItem> findCartItemsByUserId(@Param("userId") String userId);

  @Select("SELECT * FROM cartitems WHERE user_id = #{userId} AND product_id = #{productId}")
  @ResultMap("CartMapper.cartItemMap")
  Optional<CartItem> findCartItemByUserIdAndProductId(
      @Param("userId") String userId, @Param("productId") String productId);

  @Insert(
      "INSERT INTO cartitems(cart_item_id, user_id, product_id, quantity) "
          + "VALUES(#{cartItemId}, #{userId}, #{productId}, #{quantity})")
  int saveCartItem(CartItem cartItem);

  @Update("UPDATE cartitems SET " + "quantity = #{quantity}" + "WHERE cart_item_id = #{cartItemId}")
  int updateCartItem(CartItem cartItem);

  @Delete("DELETE FROM cartItem WHERE cart_item_id = #{cartItemId}")
  int deleteCartItemByCartItemId(@Param("cartItemId") String cartItemId);

  @Delete({
    "<script>",
    "DELETE FROM cartitems",
    "WHERE cart_item_id IN",
    "<foreach item='cartItemId' collection='cartItemIds' open='(' separator=',' close=')'>",
    "#{cartItemId}",
    "</foreach>",
    "</script>"
  })
  int deleteCartItemsByCartItemIds(@Param("cartItemIds") List<String> cartItemIds);
}
