package com.example.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DTO.ProductDetailFullDTO;
import com.example.Repository.InvoiceDao;
import com.example.Repository.ProductsDao;
import com.example.entity.*;
import com.example.service.ShoppingCartService;
import com.example.services.InvoiceService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class cartController {


	@Autowired
	ShoppingCartService cart;

	@Autowired
	InvoiceDao invoiceDao;

	@Autowired
	InvoiceService invoiceService;
	


	@RequestMapping("/cart/view")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("count", cart.getCount());
		model.addAttribute("Amount", cart.getAmount());
		return "client/cart";
	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/cart/view"; // hiển thị giỏ hàng
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{id}/{pre}")
	public String update(@PathVariable("id") Integer id, @PathVariable("pre") String pre) {
		cart.update(id, pre);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}

//	@PostMapping("/createbill")
//	public ResponseEntity<String> createInvoice(@ModelAttribute Invoices invoice, HttpSession session) {
//		// Lấy username từ session
//		Customers usernameFromSession = (Customers) session.getAttribute("loggedInUser");
//		String username1 = usernameFromSession.getCustomerName();
//		double total = cart.getAmount();
//		 BigDecimal totalAll = new BigDecimal(total);
//		if (username1 == null) {
//			throw new RuntimeException("Người dùng chưa đăng nhập.");
//		}
//		if (username1 != null) {
//			invoiceService.createAndSaveInvoice(username1,totalAll, session);
//			invoice.setInvoiceDate(new Date()); // Gán ngày hóa đơn
//			invoice.setTotalAmount(totalAll);
//			System.out.println(totalAll);
//		}
//	
//		return ResponseEntity.ok("Hóa đơn đã được tạo và lưu thành công.");
//	}

	
	@PostMapping("/createbill")
	public ResponseEntity<String> createInvoice(@ModelAttribute Invoices invoice, HttpSession session) {
	    Customers usernameFromSession = (Customers) session.getAttribute("loggedInUser");
	    String username1 = usernameFromSession.getCustomerName();
	    double total = cart.getAmount();
	    BigDecimal totalAll = BigDecimal.valueOf(total);

	    if (username1 == null) {
	        throw new RuntimeException("Người dùng chưa đăng nhập.");
	    }

	    // Tạo và lưu hóa đơn, đồng thời lấy về hóa đơn đã được lưu
	    Invoices savedInvoice = invoiceService.createAndSaveInvoice(username1, totalAll, session);

	    if (savedInvoice == null || savedInvoice.getInvoiceId() == null) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body("Không thể lưu hóa đơn. Vui lòng thử lại.");
	    }

	    // Gán lại invoice với đối tượng đã lưu để đảm bảo invoiceId không rỗng
	    invoice.setInvoiceId(savedInvoice.getInvoiceId());
	    invoice.setInvoiceDate(savedInvoice.getInvoiceDate());
	    invoice.setTotalAmount(savedInvoice.getTotalAmount());

	    // Lưu chi tiết hóa đơn nếu invoice có id hợp lệ
	    Map<Products, Integer> shoppingCart = cart.getItems1();
	    invoiceService.saveInvoiceDetails(shoppingCart, savedInvoice);

	    return ResponseEntity.ok("Hóa đơn đã được tạo và lưu thành công.");
	}


	
	


}
