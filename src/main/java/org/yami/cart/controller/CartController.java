package org.yami.cart.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yami.cart.dto.CartItem;
import org.yami.cart.service.CartService;
import org.yami.common.dto.MessageUtil;
import org.yami.common.security.SecurityUtil;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

  private final CartService cartService;

  private final ObjectMapper objectMapper;

  @GetMapping("/cart")
  public String cart(Model model) throws JsonProcessingException {
    model.addAttribute(
        "cartItems",
        objectMapper.writeValueAsString(
            cartService.findCartItemsByUserId(SecurityUtil.getCurrentLoggedInUser().getUserId())));

    return "cart/index";
  }

  @PostMapping("/cart/add")
  @ResponseBody
  public ResponseEntity<Map<String, String>> addCartItem(@RequestBody CartItem cartItem) {
    cartItem.setUserId(SecurityUtil.getCurrentLoggedInUser().getUserId());

    cartService.addCartItem(cartItem);

    return new ResponseEntity<>(MessageUtil.success("해당 상품이 장바구니에 추가되었습니다."), HttpStatus.OK);
  }

  @PostMapping("/cart/update")
  @ResponseBody
  public ResponseEntity<Void> updateCartItem(@RequestBody CartItem cartItem) {
    cartItem.setUserId(SecurityUtil.getCurrentLoggedInUser().getUserId());

    cartService.updateCartItem(cartItem);

    return new ResponseEntity<>(HttpStatus.OK);
  }

  @PostMapping("/cart/delete")
  public ResponseEntity<Void> deleteCartItem(@RequestBody ArrayList<String> cartItemIds) {
    cartService.deleteCartItemsByCartItemIds(cartItemIds);

    return new ResponseEntity<>(HttpStatus.OK);
  }
}
