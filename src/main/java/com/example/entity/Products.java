package com.example.entity;





import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "[Products]")
public class Products {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer productId;

    private String category;
    private String brand;
    
    @Column(nullable = false)
    private String name;

    @Lob
    private String description;

    @Column(name = "selling_price", nullable = false)
    private BigDecimal sellingPrice;

    @Column(name = "import_price", nullable = false)
    private BigDecimal importPrice;

    private Integer stock;
    
    private String img;  // Đường dẫn đến hình ảnh sản phẩm

    @Column(name = "created_at", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    private String manufacture;
    private String gift;
    private String policy;
//    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
//    private List<ProductDetails> productDetails; // Kiểm tra tên thuộc tính và kiểu dữ liệu

   
}
