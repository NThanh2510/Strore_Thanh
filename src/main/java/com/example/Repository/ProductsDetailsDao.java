package com.example.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.entity.*;

public interface ProductsDetailsDao extends JpaRepository<ProductDetails, Integer> {

}
