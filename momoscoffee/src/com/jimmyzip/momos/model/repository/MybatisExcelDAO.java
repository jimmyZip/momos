package com.jimmyzip.momos.model.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MybatisExcelDAO implements ExcelDAO{

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<Object> getProducts(Map<String, Object> searchMap) {
		return sessionTemplate.selectList("Product.selectExcel",searchMap);
	}

	@Override
	public List<Object> getProductImage(Map<String, Object> searchMap) {
		return sessionTemplate.selectList("ProductImage.selectExcel", searchMap);
	}

	@Override
	public List<Object> getBranch(Map<String, Object> searchMap) {
		return sessionTemplate.selectList("Branch.selectExcel", searchMap);
	}

	@Override
	public List<Object> getBranchImage(Map<String, Object> searchMap) {
		return sessionTemplate.selectList("BranchImage.selectExcel", searchMap);
	}
	
}
