package com.jimmyzip.momos.model.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.exception.RegistFailException;
import com.jimmyzip.momos.model.domain.product.Subcategory;
import com.jimmyzip.momos.model.repository.product.SubcategoryDAO;

@Service
@Transactional
public class SubategoryServiceImpl implements SubcategoryService{
	@Autowired
	@Qualifier("mybatisSubcategoryDAO")
	private SubcategoryDAO subcategoryDAO;
	
	public Subcategory select(int subcategory_id) {
		return subcategoryDAO.select(subcategory_id);
	}
	
	public List<Subcategory> selectAll(){
		return subcategoryDAO.selectAll();
	}

	public List<Subcategory> selectAllByFk(int topcategory_id) {
		return subcategoryDAO.selectAllByFk(topcategory_id);
	}

	public Subcategory selectByName(String subcate_name) {
		return subcategoryDAO.selectByName(subcate_name);
	}

	public void insert(Subcategory subcategory) throws RegistFailException{
		int result = subcategoryDAO.insert(subcategory);
		if(result==0) {
			throw new RegistFailException("하위카테고리 등록 실패");
		}
	}

	public Subcategory cateNameCheck(String subcate_name) {
		return subcategoryDAO.cateNameCheck(subcate_name);
	}

	public void update(Subcategory subcategory) throws EditFailException{
		int result = subcategoryDAO.update(subcategory);
		if(result==0) {
			throw new EditFailException("하위카테고리 수정 실패.");
		}
	}

	public void delete(int subcategory_id) throws DeleteFailException{
		int result = subcategoryDAO.delete(subcategory_id);
		if(result==0) {
			throw new DeleteFailException("하위카테고리 삭제 실패");
		}
	}
}