package com.jimmyzip.momos.model.service.product;

import java.util.List;

import com.jimmyzip.momos.model.domain.product.Topcategory;

public interface TopcategoryService {
	public Topcategory select(int topcategory_id);
	public List<Topcategory> selectAll();
	public Topcategory selectByName(String topcate_name);
	public void insert(Topcategory topcategory);
	public Topcategory cateNameCheck(String topcate_name);
	public void update(Topcategory topcategory);
	public void delete(int topcategory_id);
	//public void search(String searchWord);
}
