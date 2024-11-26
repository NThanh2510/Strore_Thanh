package com.example.serviceImpl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.example.Repository.ProductsDao;
import com.example.entity.Products;
import com.example.service.ShoppingCartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	@Autowired
	ProductsDao productsdao;
	Map<Integer, Products> map = new HashMap<>();
	@Override
	public Products add(Integer id) {
	    Products item = productsdao.findByProductId(id);

	    Products cartItem = map.get(id);
	    if (cartItem == null) {
	        item.setStock(1);
	        map.put(id, item);
	    } else {
	        cartItem.setStock(cartItem.getStock() + 1);
	    }
	    return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public Products update(Integer id, String qty) {
		Products item = map.get(id);
		if(qty.equals("minus") && item.getStock()>0) {
			item.setStock(item.getStock()-1);
			if(item.getStock() == 0)
				this.remove(id);
		}else if(qty.equals("plus") &&item.getStock()<100) {
			item.setStock(item.getStock()+1);
		}
		return item;
	}

	@Override
	public void clear() {
		// xoa het gio hang
		map.clear();
	}

	@Override
	public Collection<Products> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item -> item.getStock()).sum();
	}

	@Override
	public double getAmount() {
		return map.values().stream()
		        .mapToDouble(item -> item.getSellingPrice().doubleValue() * item.getStock())
		        .sum();
	}

	@Override
	public Map<Products, Integer> getItems1() {
        Map<Products, Integer> items = new HashMap<>();

        for (Products product : map.values()) {
            int quantity = product.getStock(); // Giả sử Products có phương thức getQuantity() để lấy số lượng
            items.put(product, quantity);
        }
        
        return items; // Trả về một bản sao của giỏ hàng với Products làm khóa và số lượng làm giá trị
    }

	
	
	

}
