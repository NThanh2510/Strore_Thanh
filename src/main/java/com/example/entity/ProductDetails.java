package com.example.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "[product_details]")
public class ProductDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer detailId;
//    @Column(name = "product_id")
//    private Integer productId;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Products product; // Tham chiếu đến bảng Products
    private String screen; // Màn hình
    private String os; // Hệ điều hành
    private String rearCamera; // Camera sau
    private String frontCamera; // Camera trước
    private String cpu; // CPU
    private String ram; // RAM
    private String storage; // Bộ nhớ trong
    private String batteryCapacity; // Dung lượng pin
}
