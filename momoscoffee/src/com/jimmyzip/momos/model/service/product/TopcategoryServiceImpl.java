package com.jimmyzip.momos.model.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.exception.RegistFailException;
import com.jimmyzip.momos.model.domain.product.Topcategory;
import com.jimmyzip.momos.model.repository.product.SubcategoryDAO;
import com.jimmyzip.momos.model.repository.product.TopcategoryDAO;

@Service
@Transactional
public class TopcategoryServiceImpl implements TopcategoryService{
	@Autowired
	@Qualifier("mybatisTopcategoryDAO")
	private TopcategoryDAO topcategoryDAO;
	
	@Autowired
	@Qualifier("mybatisSubcategoryDAO")
	private SubcategoryDAO subcategoryDAO;
	
	public Topcategory select(int topcategory_id) {
		return topcategoryDAO.select(topcategory_id);
	}

	public List<Topcategory> selectAll() {
		return topcategoryDAO.selectAll();
	}

	public Topcategory selectByName(String topcate_name) {
		return topcategoryDAO.selectByName(topcate_name);
	}

	public void insert(Topcategory topcategory) throws RegistFailException{
		int result = topcategoryDAO.insert(topcategory);
		if(result==0) {
			throw new RegistFailException("상위카테고리 등록 실패. 정보를 확인해주세요.");
		}
	}

	public Topcategory cateNameCheck(String topcate_name) {
		return topcategoryDAO.cateNameCheck(topcate_name);
	}

	public void update(Topcategory topcategory) throws EditFailException{
		int result = topcategoryDAO.update(topcategory);
		if(result==0) {
			throw new EditFailException("상위카테고리 수정 실패. 정보를 확인해주세요.");
		}
	}

	public void delete(int topcategory_id) throws DeleteFailException{
		int result = topcategoryDAO.delete(topcategory_id);
		//int result2=0;
		/*
		if(result!=0) {
			result2 = subcategoryDAO.delete()
		}
		*/
		if(result==0) {
			throw new DeleteFailException("상위카테고리 삭제 실패.");
		}
	}
	
}
