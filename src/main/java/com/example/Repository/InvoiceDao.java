package com.example.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.entity.*;

public interface InvoiceDao extends JpaRepository<Invoices, Integer>{

}
