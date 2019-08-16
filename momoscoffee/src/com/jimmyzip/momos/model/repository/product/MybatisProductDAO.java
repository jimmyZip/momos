package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jimmyzip.momos.model.domain.product.Product;
import com.jimmyzip.momos.model.domain.product.Topcategory;

@Repository
public class MybatisProductDAO implements ProductDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	//상품의 pk값으로 1건 조회
	public Product select(int product_id) {
		return sessionTemplate.selectOne("Product.select", product_id);
	}

	//전체상품조회
	public List<Product> selectAll(){
		return sessionTemplate.selectList("Product.selectAll");
	}
	
	//서브카테고리 선택 시 해당 하위제품 전체조회
	public List<Product> selectAllByFk(int subcategory_id){
		return sessionTemplate.selectList("Product.selectAllByFk", subcategory_id);
	}
	
	//상품등록, regist product
	public int insert(Product product) {
		return sessionTemplate.insert("Product.insert", product);
	}
	
	//제품명 중복확인
	public Product nameDoubleCheck(Product product) {
		return sessionTemplate.selectOne("Product.prodNameCheck", product);
	}
	
	//가격으로 제품조회
	public List<Product> selectByPrice(int price) {
		return sessionTemplate.selectList("Product.selectByPrice", price);
	}
	
	//상품정보 수정,갱신, update(modify) product's info
	public int update(Product product) {
		return sessionTemplate.update("Product.update",product);
	}
	
	//상품 삭제,delete product
	public int delete(int product_id) {
		return sessionTemplate.delete("Product.delete", product_id);
	}
	
	//상품에 대한 검색
	public List<Product> search(String searchWord){
		return sessionTemplate.selectList("Product.search", searchWord);
	}
}
