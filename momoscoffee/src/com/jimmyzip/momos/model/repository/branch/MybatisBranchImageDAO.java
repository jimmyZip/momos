package com.jimmyzip.momos.model.repository.branch;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jimmyzip.momos.model.domain.branch.BranchImage;

@Repository
public class MybatisBranchImageDAO implements BranchImageDAO{

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	//이미지 pk값으로 조회
	public BranchImage select(int branch_image_id) {
		return sessionTemplate.selectOne("BranchImage.select",branch_image_id);
	}
	//전체 이미지 조회
	public List<BranchImage> selectAll() {
		return sessionTemplate.selectList("BranchImage.selectAll");
	}
	//branch_id로 해당 이미지 조회
	public List<BranchImage> selectAllByFk(int branch_id) {
		return sessionTemplate.selectList("BranchImage.selectAllByFk", branch_id);
	}
	//이미지 삽입 
	public int insert(BranchImage branchImage) {
		return sessionTemplate.insert("BranchImage.insert", branchImage);
	}
	//이미지 수정
	public int update(BranchImage branchImage) {
		return sessionTemplate.update("BranchImage.update", branchImage);
	}
	
	public int updateFile(BranchImage branchImage) {
		return sessionTemplate.insert("BranchImage.updateFile",branchImage);
	}
	//이미지 삭제
	public int deleteAllByFk(int branch_id) {
		return sessionTemplate.delete("BranchImage.delete", branch_id);
	}

	public int deleteFile(BranchImage branchImage) {
		return sessionTemplate.delete("BranchImage.deleteFile", branchImage);
	}

	//이미지 검색
	public List<BranchImage> search(String searchWord) {
		return sessionTemplate.selectList("BranchImage.search", searchWord);
	}

}
