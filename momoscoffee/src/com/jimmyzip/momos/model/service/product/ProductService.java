package com.jimmyzip.momos.model.service.product;

import java.util.List;

import com.jimmyzip.momos.model.domain.product.Product;
import com.jimmyzip.momos.model.domain.product.ProductImage;

public interface ProductService {
	public Product select(int product_id);
	public List<Product> selectAll();
	public List<Product> selectAllByFk(int subcategory_id);	
	public void insert(Product product,ProductImage productImage,String path);
	public Product nameDoubleCheck(Product product);
	public List<Product> selectByPrice(int price);
	public void update(Product product,ProductImage productImage,String path);
	//public void delete(int product_id,String path);
	public void delete(List<Integer> deleteArray,String path);
	public List<Product> search(String searchWord);
	public List<ProductImage> getImg();
}
