package com.example.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.DTO.ProductDetailFullDTO;
import com.example.Repository.ProductsDao;
import com.example.entity.*;


public interface ProductService {

	List<Products> findAllByNameSearch(String name);
	List<Products> findAllProductsOrderedByCreatedAt();
	ProductDetailFullDTO findProductDetailById(Integer productId);
	Products findByProductId(Integer productId);
	List<Products> findAllProductsByBrand(String brand);
	List<Products> findAll();
	
	void updatePartialProduct(Integer productId, String name, 
			 BigDecimal sellingPrice, String description, String gift, 
			 String policy, ProductDetails productDetails);
	
}
