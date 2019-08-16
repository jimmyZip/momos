package com.jimmyzip.momos.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jimmyzip.momos.model.domain.product.ProductImage;
@Repository
public class MybatisProductImageDAO implements ProductImageDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	//이미지 pk값으로 조회
	public ProductImage select(int product_image_id) {
		return sessionTemplate.selectOne("ProductImage.select", product_image_id);
	}
	
	//전체 이미지 조회
	public List<ProductImage> selectAll() {
		return sessionTemplate.selectList("ProductImage.selectAll");
	}
	
	//product_id로 해당 이미지 전체 조회
	public List<ProductImage> selectAllByFk(int product_id) {
		return sessionTemplate.selectList("ProductImage.selectAllByFk", product_id);
	}
	
	//이미지 삽입
	public int insert(ProductImage productImage) {
		return sessionTemplate.insert("ProductImage.insert", productImage);
	}
	
	//이미지 수정
	public int update(ProductImage productImage) {
		System.out.println("mybatisProductImageDAO에서 이미지 수정 요청받았다.");
		return sessionTemplate.update("ProductImage.update", productImage);
	}
	
	public int updateFile(ProductImage productImage) {
		return sessionTemplate.insert("ProductImage.updateFile",productImage);
	}

	//이미지 삭제
	public int deleteAllByFk(int product_id) {
		return sessionTemplate.delete("ProductImage.delete", product_id);
	}
	
	public int deleteFile(ProductImage productImage) {
		return sessionTemplate.delete("ProductImage.deleteFile",productImage);
	}

	//이미지 검색
	public List<ProductImage> search(String searchWord) {
		return sessionTemplate.selectList("ProductImage.search", searchWord);
	}

}
