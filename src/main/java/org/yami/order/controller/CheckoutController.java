package org.yami.order.controller;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.yami.order.dto.Order;
import org.yami.order.dto.OrderItem;
import org.yami.order.service.CheckoutService;


@Controller
public class CheckoutController {
	
	@Autowired
	private CheckoutService service;
	
	@RequestMapping("/order/checkout")
	public ModelAndView checkout(ModelAndView mView) {
		
		//OrderItem dto = session.메서드명(id);
		
		service.createOrder(mView);
		mView.setViewName("order/checkout");
		
		return mView;
	}
}
