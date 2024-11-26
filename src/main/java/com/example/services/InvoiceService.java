package com.example.services;

import jakarta.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.Repository.InvoiceDao;
import com.example.Repository.InvoiceDetailsDao;
import com.example.entity.*;

@Service
public class InvoiceService {

    @Autowired
    private InvoiceDao invoiceRepository;

    @Autowired
    private InvoiceDetailsDao invoiceDetailRepository;

    public Invoices createAndSaveInvoice(String customerName, BigDecimal totalAmount, HttpSession session) {
        Invoices invoice = new Invoices();
        Customers username = (Customers) session.getAttribute("loggedInUser");
        invoice.setCustomer(username);
        invoice.setTotalAmount(totalAmount);
        invoice.setInvoiceDate(new Date());

        // Lưu hóa đơn và trả về đối tượng đã lưu
        return invoiceRepository.save(invoice);
    }
 
    @Transactional
    public void saveInvoiceDetails(Map<Products, Integer> shoppingCart, Invoices invoice) {
        if (shoppingCart == null || shoppingCart.isEmpty() || invoice == null) {
            throw new IllegalArgumentException("Giỏ hàng hoặc hóa đơn không hợp lệ.");
        }

        for (Map.Entry<Products, Integer> entry : shoppingCart.entrySet()) {
            Products product = entry.getKey();
            Integer quantity = entry.getValue();

            if (quantity == null || quantity < 1) {
                quantity = 1; // Giá trị mặc định
            }

            InvoiceDetails invoiceDetail = new InvoiceDetails();
            
            invoiceDetail.setInvoice(invoice);
            invoiceDetail.setProduct(product);
            invoiceDetail.setQuantity(quantity);
            

            // Tính giá trị của chi tiết hóa đơn
            BigDecimal price = product.getSellingPrice() != null 
                ? product.getSellingPrice().multiply(BigDecimal.valueOf(quantity)) 
                : BigDecimal.ZERO;
            invoiceDetail.setUnitPrice(price);
            invoiceDetail.setLineTotal();

            // Lưu chi tiết hóa đơn vào cơ sở dữ liệu
            invoiceDetailRepository.save(invoiceDetail);
        }
    }

}