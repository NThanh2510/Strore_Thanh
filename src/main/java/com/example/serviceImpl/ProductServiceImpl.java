package com.example.serviceImpl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.DTO.ProductDetailFullDTO;
import com.example.Repository.ProductsDao;
import com.example.Repository.ProductsDetailsDao;
import com.example.entity.ProductDetails;
import com.example.entity.Products;
import com.example.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductsDao productsDao;
	@Autowired
	ProductsDetailsDao productsDetailsDao;

	@Override
	public List<Products> findAllByNameSearch(String name) {
		return productsDao.findAllByNameSearch(name);
	}

	@Override
	public List<Products> findAllProductsOrderedByCreatedAt() {

		return productsDao.findAllProductsOrderedByCreatedAt();
	}

	@Override
	public ProductDetailFullDTO findProductDetailById(Integer productId) {
		// TODO Auto-generated method stub
		return productsDao.findProductDetailById(productId);
	}

	@Override
	public Products findByProductId(Integer productId) {
		// TODO Auto-generated method stub
		return productsDao.findByProductId(productId);
	}

	@Override
	public List<Products> findAllProductsByBrand(String brand) {
		// TODO Auto-generated method stub
		return productsDao.findAllProductsByBrand(brand);
	}

	@Override
	public List<Products> findAll() {
		// TODO Auto-generated method stub
		return productsDao.findAll();
	}

	@Override
	@Transactional
	public void updatePartialProduct(Integer productId, String name, BigDecimal sellingPrice, String description,
			String gift, String policy, ProductDetails productDetails) {

		Products existingProduct = findByProductId(productId);
		existingProduct.setSellingPrice(sellingPrice);
		existingProduct.setName(name); // Nếu muốn cập nhật cả tên
		existingProduct.setDescription(description);
		existingProduct.setGift(gift);
		existingProduct.setPolicy(policy);

		// Gắn ProductDetails vào Product
		productDetails.setProduct(existingProduct);

		// Lưu thay đổi
		productsDao.save(existingProduct);
		productsDetailsDao.save(productDetails); // Nếu cần cập nhật chi tiết sản phẩm
	}
}
