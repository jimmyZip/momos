package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import com.jimmyzip.momos.model.domain.product.Topcategory;

public interface TopcategoryDAO {
	public Topcategory select(int topcategory_id);
	public List<Topcategory> selectAll();
	public Topcategory selectByName(String topcate_name);
	public int insert(Topcategory topcategory);
	public Topcategory cateNameCheck(String topcate_name);
	public int update(Topcategory topcategory);
	public int delete(int topcategory_id);
}
