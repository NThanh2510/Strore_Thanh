package com.example.service;

import java.util.List;

import com.example.entity.Customers;

public interface CustomersService {
	boolean existsByUsername(String customers);
	List<Customers> findAll();
	Customers save(Customers customers);
	Customers findByUsername(String username);
}
