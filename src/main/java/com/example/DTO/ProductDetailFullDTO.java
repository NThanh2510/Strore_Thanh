package com.example.DTO;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDetailFullDTO {

	private Integer productId;
	private String category;
	private String brand;
	private String name;
	private String description;
	private BigDecimal sellingPrice;
	private BigDecimal importPrice;
	private Integer stock;
	private String img;
	private Date createdAt;
	private String manufacture;
	private String gift;
	private String policy;
	private String screen;
	private String os;
	private String rearCamera;
	private String frontCamera;
	private String cpu;
	private String ram;
	private String storage;
	private String batteryCapacity;

}
