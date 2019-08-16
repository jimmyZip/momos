package com.jimmyzip.momos.model.repository;

import java.util.List;
import java.util.Map;

public interface ExcelDAO {
	public List<Object> getProducts(Map<String, Object> searchMap);
	public List<Object> getProductImage(Map<String, Object> searchMap);
	public List<Object> getBranch(Map<String, Object> searchMap);
	public List<Object> getBranchImage(Map<String, Object> searchMap);
}
