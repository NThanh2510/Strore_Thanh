package com.example.Repository;

import java.util.List;
import java.util.Optional;

import com.example.DTO.*;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.entity.*;
@Repository
public interface ProductsDao extends JpaRepository<Products, Integer> {

	@Query("SELECT p FROM Products p ORDER BY p.createdAt DESC")
	List<Products> findAllProductsOrderedByCreatedAt();

	@Query("SELECT new com.example.DTO.ProductDetailFullDTO(p.productId, p.category, p.brand, p.name, p.description, "
			+ "p.sellingPrice,p.importPrice ,p.stock, p.img, p.createdAt, p.manufacture, "
			+ "p.gift, p.policy, pd.screen, pd.os, pd.rearCamera, pd.frontCamera, "
			+ "pd.cpu, pd.ram, pd.storage, pd.batteryCapacity) "
			+ "FROM Products p JOIN ProductDetails pd ON p.productId = pd.product.productId " + // Sửa ở đây
			"WHERE p.productId = ?1")
	ProductDetailFullDTO findProductDetailById(Integer productId);

//	 @Query("SELECT p FROM Products p WHERE p.productId = ?1")
//	    Products findProductById1( Integer productId);

	Products findByProductId(Integer productId);

	@Query("SELECT p FROM Products p WHERE p.brand = ?1")
	List<Products> findAllProductsByBrand(String brand);
	
	@Query("SELECT p FROM Products p WHERE p.name LIKE %?1%")
	List<Products> findAllByNameSearch(String name);
}
