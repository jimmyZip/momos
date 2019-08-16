package com.jimmyzip.momos.model.repository.branch;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jimmyzip.momos.model.domain.branch.Branch;

@Repository
public class MybatisBranchDAO implements BranchDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;

	//지점 pk값으로 1건조회
	public Branch select(int branch_id) {
		return sessionTemplate.selectOne("Branch.select", branch_id);
	}
	//전체지점 조회
	public List<Branch> selectAll() {
		return sessionTemplate.selectList("Branch.selectAll");
	}
	//지점등록
	public int insert(Branch branch) {
		return sessionTemplate.insert("Branch.insert", branch);
	}
	//지점명 중복확인
	public Branch nameDoubleCheck(Branch branch) {
		return sessionTemplate.selectOne("Branch.branchNameCheck", branch);
	}
	//지점정보 수정,갱신
	public int update(Branch branch) {
		return sessionTemplate.update("Branch.update", branch);
	}
	//지점삭제
	public int delete(int branch_id) {
		return sessionTemplate.delete("Branch.delete", branch_id);
	}
	//지점검색
	public List<Branch> search(String searchWord) {
		return sessionTemplate.selectList("Branch.search", searchWord);
	}

}
