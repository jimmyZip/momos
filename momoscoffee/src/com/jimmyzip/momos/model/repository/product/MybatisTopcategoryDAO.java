package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.model.domain.product.Topcategory;

@Repository
@Transactional
public class MybatisTopcategoryDAO implements TopcategoryDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public Topcategory select(int topcategory_id) {
		return sessionTemplate.selectOne("Topcategory.select",topcategory_id);
	}

	public List<Topcategory> selectAll() {
		return sessionTemplate.selectList("Topcategory.selectAll");
	}

	public Topcategory selectByName(String topcate_name) {
		return sessionTemplate.selectOne("Topcategory.selectByName", topcate_name);
	}

	public int insert(Topcategory topcategory) {
		return sessionTemplate.insert("Topcategory.insert", topcategory);
	}

	public Topcategory cateNameCheck(String topcate_name) {
		return sessionTemplate.selectOne("Topcategory.cateNameCheck", topcate_name);
	}

	public int update(Topcategory topcategory) {
		return sessionTemplate.update("Topcategory.update", topcategory);
	}

	public int delete(int topcategory_id) {
		return sessionTemplate.delete("Topcategory.delete", topcategory_id);
	}
}
