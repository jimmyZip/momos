package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import com.jimmyzip.momos.model.domain.product.Product;

public interface ProductDAO {
	public Product select(int product_id);
	public List<Product> selectAll();
	public List<Product> selectAllByFk(int subcategory_id);
	public int insert(Product product);
	public Product nameDoubleCheck(Product product);
	public List<Product> selectByPrice(int price);
	public int update(Product product);
	public int delete(int product_id);
	public List<Product> search(String searchWord);
}
