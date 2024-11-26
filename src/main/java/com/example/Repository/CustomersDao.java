package com.example.Repository;
import com.example.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CustomersDao extends JpaRepository<Customers, String>{
	 boolean existsByUsername(String username);
	 
	 @Query("SELECT p FROM Customers p WHERE p.username = ?1")
	 Customers findByUsername(String useranme);
}
