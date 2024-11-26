package com.example.serviceImpl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.DTO.ProductDetailFullDTO;
import com.example.Repository.CustomersDao;
import com.example.Repository.ProductsDao;
import com.example.Repository.ProductsDetailsDao;
import com.example.entity.Customers;
import com.example.entity.ProductDetails;
import com.example.entity.Products;
import com.example.service.CustomersService;
import com.example.service.ProductService;

@Service
public class CustomersServiceImpl implements CustomersService {

	@Autowired
	CustomersDao customersDao;
	
	@Override
	public boolean existsByUsername(String customers) {
		// TODO Auto-generated method stub
		return customersDao.existsByUsername(customers);
	}

	

	@Override
	public List<Customers> findAll() {
		// TODO Auto-generated method stub
		return customersDao.findAll();
	}



	@Override
	public Customers save(Customers customers) {
		// TODO Auto-generated method stub
		return customersDao.save(customers);
	}





	@Override
	public Customers findByUsername(String username) {
		// TODO Auto-generated method stub
		return customersDao.findByUsername(username);
	}

}
