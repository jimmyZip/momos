package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import com.jimmyzip.momos.model.domain.product.ProductImage;

public interface ProductImageDAO {
	public ProductImage select(int product_image_id);
	public List<ProductImage> selectAll();
	public List<ProductImage> selectAllByFk(int product_id);
	public int insert(ProductImage productImage);
	public int update(ProductImage productImage);
	public int updateFile(ProductImage productImage);
	public int deleteAllByFk(int product_id);
	public int deleteFile(ProductImage productImage);
	public List<ProductImage> search(String searchWord);
}
