package com.example.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DTO.ProductDetailFullDTO;
import com.example.Repository.ProductsDetailsDao;
import com.example.Repository.ProductsDao;
import com.example.entity.ProductDetails;
import com.example.entity.Products;
import com.example.service.ProductService;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("admin")
public class adminproductsController {

	@Autowired
	ProductService productService;


	
	@RequestMapping("/listproducts")
	public String showlist(Model model) {
		List<Products> productList = productService.findAll();
		model.addAttribute("products", productList);
		return "admin/list_products";
	}

	@GetMapping("/productInfo/{id}")
	public String infoProduct(@PathVariable("id") Integer productId, Model model) {
	    ProductDetailFullDTO infoProduct = productService.findProductDetailById(productId);
	    model.addAttribute("product", infoProduct);
	    return "admin/info_product";
	}
	
//	@PostMapping("/productInfo/update")
//	public String infoProduct(@ModelAttribute Products products, @ModelAttribute ProductDetails productDetails) {
//	    productsdao.save(products);
//	    productDetails.setProduct(products);
//	    productsDetailsDao.save(productDetails);
//	    return "redirect:/admin/info_product";
//	}
	
	@PostMapping("/productInfo/update")
	public String updatePartialProduct(@RequestParam("productId") Integer productId,
	                                   @RequestParam("name") String name,
	                                   @RequestParam("sellingPrice") BigDecimal sellingPrice,
	                                   @RequestParam("description") String description,
	                                   @RequestParam("gift") String gift,
	                                   @RequestParam("policy") String policy,
	                                   ProductDetails productDetails) {
		productService.updatePartialProduct(productId, name, sellingPrice, description, gift, policy, productDetails);
	    

	   

	    return "redirect:/admin/listproducts"; // Chuyển hướng về danh sách sản phẩm
	}
	
}
