package com.jimmyzip.momos.model.service.product;

import java.util.List;

import com.jimmyzip.momos.model.domain.product.Subcategory;

public interface SubcategoryService {
	public Subcategory select(int subcategory_id);
	public List<Subcategory> selectAll();
	public List<Subcategory> selectAllByFk(int topcategory_id);
	public Subcategory selectByName(String subcate_name);
	public void insert(Subcategory subcategory);
	public Subcategory cateNameCheck(String subcate_name);
	public void update(Subcategory subcategory);
	public void delete(int subcategory_id);
}
