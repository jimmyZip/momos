package com.jimmyzip.momos.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.model.repository.ExcelDAO;

@Service
@Transactional
public class ExcelServiceImpl implements ExcelService{
	@Autowired
	@Qualifier("mybatisExcelDAO")
	private ExcelDAO excelDAO;
	
	@Override
	public List<Object> getAllObjects(String target, Map<String, Object> searchMap) {
		//controller에서 넘어온 target에 따라서 dao 실행을 구분
        if(target.equals("product")){
            //return excelDao.getBooks(searchMap);//검색조건 searchMap를 넘겨줌
        	return excelDAO.getProducts(searchMap);
        }
 
        if(target.equals("productImage")){
            //return excelDao.getBooksDetail(searchMap);//검색조건 searchMap를 넘겨줌
        	return excelDAO.getProductImage(searchMap);
        }
        
        if(target.equals("branch")){
            //return excelDao.getBooks(searchMap);//검색조건 searchMap를 넘겨줌
        	return excelDAO.getBranch(searchMap);
        }
 
        if(target.equals("branchtImage")){
            //return excelDao.getBooksDetail(searchMap);//검색조건 searchMap를 넘겨줌
        	return excelDAO.getBranchImage(searchMap);
        }
 
        return null;
	}

}
