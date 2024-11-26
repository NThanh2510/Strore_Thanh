package com.example.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.Repository.*;
import com.example.entity.Customers;
import com.example.serviceImpl.CustomersServiceImpl;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class customersController {
	@Autowired
	CustomersServiceImpl customersServiceImpl;

	@RequestMapping("/trangchu/create")
	public String test() {
		return "client/DangKy";
	}

	@RequestMapping("/trangchu/login")
	public String logintest() {
		return "client/DangNhap";
	}

	@PostMapping("/create")
	public String create(@ModelAttribute Customers customers, Model model) {
		if (customersServiceImpl.existsByUsername(customers.getUsername())) {
			model.addAttribute("error", "Tên người dùng đã tồn tại");
			return "client/DangKy";
		}
		customersServiceImpl.save(customers);
		model.addAttribute("error", "Đăng ký thành công");
		return "client/DangNhap";
	}

	@PostMapping("/checkLogin")
	public String Login(@RequestParam String username, @RequestParam String password, Model model,
			HttpSession session) {
		List<Customers> users = customersServiceImpl.findAll();
		Customers user = null;
		for (Customers customers : users) {
			if (customers.getUsername().equals(username)) {
				user = customers;
				break;
			}
		}
		if (user != null && user.getPassword().equals(password)) {
			session.setAttribute("loggedInUser", user);
			return "redirect:/trangchu/index";
		} else {
			model.addAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
			return "client/DangNhap";
		}

	}

	@GetMapping("/checkuserID")
	public String checkuserID(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("error", "Vui lòng đăng nhập");
		return "redirect:/trangchu/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "redirect:/trangchu/index";
	}

	@GetMapping("/info/{username}")
	public String userInfo(@PathVariable("username") String username, Model model) {
		// Lấy thông tin người dùng theo username
		Customers user = customersServiceImpl.findByUsername(username);

		if (user != null) {
			model.addAttribute("user", user);
			return "client/userInfo"; // Trả về view thông tin người dùng
		} else {
			return "redirect:/trangchu/login"; // Nếu không tìm thấy, chuyển hướng đến trang login
		}

	}
}
