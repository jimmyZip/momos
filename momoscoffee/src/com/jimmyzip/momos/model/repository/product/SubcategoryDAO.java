package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import com.jimmyzip.momos.model.domain.product.Subcategory;

public interface SubcategoryDAO {
	public Subcategory select(int subcategory_id);
	public List<Subcategory> selectAll();
	public List<Subcategory> selectAllByFk(int topcategory_id);
	public Subcategory selectByName(String subcate_name);
	public int insert(Subcategory subcategory);
	public Subcategory cateNameCheck(String subcate_name);
	public int update(Subcategory subcategory);
	public int delete(int subcategory_id);
}
