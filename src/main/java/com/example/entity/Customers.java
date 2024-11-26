package com.example.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;



@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "[customers]")
public class Customers {

	@Id
	@Column(name = "username", nullable = false)
    private String username;

    @Column(name = "customer_name", nullable = false)
    private String customerName;


    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "address")
    private String address;

    @Column(name = "phonenumber", length = 15)
    private String phoneNumber;

    @Column(name = "email", length = 50)
    private String email;

    @OneToMany(mappedBy = "customer")
    private List<Invoices> invoices;


}
