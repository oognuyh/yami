package org.yami.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.yami.cart.dto.CartItem;
import org.yami.cart.service.CartService;
import org.yami.user.dto.User;

@Controller
public class CartController {

	@Autowired
	private CartService service;
	
	@RequestMapping("/cart/insert")
	@ResponseBody
	public String insert(CartItem cart, HttpServletRequest request) {
		return "";
	}
	
	@RequestMapping("/cart/list")
	public ModelAndView list(@RequestParam("userId") String userId, ModelAndView mView) {
		
		service.getList(userId);
		return mView;
	}
	
	@RequestMapping("/cart/update")
	public String update(CartItem cart) {
		service.update(cart);
		return "redirect:/cart/list/" +cart.getUserId();
	}
	
	@RequestMapping("/cart/delete")
	public String delete(CartItem cart) {
		service.delete(cart.getCartItemId());
		return "redirect:/cart/list/" +cart.getUserId();
	}
}
