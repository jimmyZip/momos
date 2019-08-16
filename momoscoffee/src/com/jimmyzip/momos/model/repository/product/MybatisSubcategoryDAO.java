package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.model.domain.product.Subcategory;

@Repository
@Transactional
public class MybatisSubcategoryDAO implements SubcategoryDAO{
	@Autowired
	SqlSessionTemplate sessionTemplate;

	public Subcategory select(int subcategory_id) {
		return sessionTemplate.selectOne("Subcategory.select", subcategory_id);
	}
	
	public List<Subcategory> selectAll(){
		return sessionTemplate.selectList("Subcategory.selectAll");
	}
	
	public List<Subcategory> selectAllByFk(int topcategory_id) {
		return sessionTemplate.selectList("Subcategory.selectAllByFk", topcategory_id);
	}

	public Subcategory selectByName(String subcate_name) {
		return sessionTemplate.selectOne("Subcategory.selectByName", subcate_name);
	}

	public int insert(Subcategory subcategory) {
		return sessionTemplate.insert("Subcategory.insert",subcategory);
	}

	public Subcategory cateNameCheck(String subcate_name) {
		return sessionTemplate.selectOne("Subcategory.cateNameCheck", subcate_name);
	}

	public int update(Subcategory subcategory) {
		return sessionTemplate.update("Subcategory.update", subcategory);
	}

	public int delete(int subcategory_id) {
		return sessionTemplate.delete("Subcategory.delete", subcategory_id);
	}
}