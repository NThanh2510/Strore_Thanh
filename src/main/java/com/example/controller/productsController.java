package com.example.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DTO.ProductDetailFullDTO;
import com.example.Repository.ProductsDao;
import com.example.entity.Products;
import com.example.service.ProductService;
import com.example.serviceImpl.ProductServiceImpl;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("trangchu")
public class productsController {

	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/index")
	public String filldata(Model model) {
		// Sản phẩm nổi bật
	    List<Products> productsNoiBat = productService.findAll();
	    //Limit 10 sản phẩm
	    List<Products> limitedProductsNoiBat = productsNoiBat.stream()
                .limit(10)
                .collect(Collectors.toList());
	    for (Products product : productsNoiBat) {
	        System.out.println("Image path: " + product.getImg());
	    }
	    model.addAttribute("productsNoiBat", limitedProductsNoiBat);
	    
	    //Sản phẩm mới nhất
	    List<Products> productsMoiNhat = productService.findAllProductsOrderedByCreatedAt();
	    //Limit 10 sản phẩm
	    List<Products> limtedProductsMoiMat =  productsMoiNhat.stream()
                .limit(10)
                .collect(Collectors.toList());
	    model.addAttribute("productsMoiMat", limtedProductsMoiMat);
	    		
	    return "client/trangchu";
	}
	

	
	@RequestMapping("/xemthem")
	public String xemthem(Model model, @RequestParam("type") String type) {
	    List<Products> products;
	    products = null;
	    if ("moinhat".equals(type)) {
	        products = productService.findAll(); // Lấy danh sách sản phẩm mới nhất
	    } else if("noibat".equals(type)){
	        products = productService.findAll(); // Lấy danh sách sản phẩm nổi bật
	    }else if("Apple".equals(type)){
	        products = productService.findAllProductsByBrand(type); // Lấy danh sách sản phẩm nổi bật
	    }else if("SamSung".equals(type)){
	        products = productService.findAllProductsByBrand(type); // Lấy danh sách sản phẩm nổi bật
	    }
	    
	    
	    model.addAttribute("products", products);
	    return "client/xemthem";
	}
	
	
	@GetMapping("/product/{id}")
	public String infoProduct(@PathVariable("id") Integer productId, Model model) {
	    ProductDetailFullDTO infoProduct = productService.findProductDetailById(productId);
	    model.addAttribute("product", infoProduct);
	    return "client/chitietProduct"; // Chỉ định template để hiển thị
	}
	
	@GetMapping("/search")
	public String searchProducts(@RequestParam("name") String name, Model model) {
		List<Products> products = productService.findAllByNameSearch(name);
        model.addAttribute("products", products);
        model.addAttribute("searchQuery", name);
        return "client/xemthem";
        
	}
	
	
	
	
	
	
}
