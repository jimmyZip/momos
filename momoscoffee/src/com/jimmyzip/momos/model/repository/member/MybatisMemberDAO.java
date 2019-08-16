package com.jimmyzip.momos.model.repository.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.model.domain.member.Members;

@Repository
@Transactional
public class MybatisMemberDAO implements MemberDAO{

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	//전체멤버조회
	public List<Members> selectAll() {
		return sessionTemplate.selectList("Members.selectAll");
	}
	//권한별 멤버 조회
	public List<Members> selectByAuth(int auth_id) {
		return sessionTemplate.selectList("Members.selectByAuth", auth_id);
	}
	//회원의 pk값으로 조회
	public Members select(int member_id) {
		return sessionTemplate.selectOne("Members.select", member_id);
	}
	//id로 회원조회
	public Members selectById(String id) {
		return sessionTemplate.selectOne("Members.selectById", id);
	}

	public Members idCheck(String id) {
		return sessionTemplate.selectOne("Members.idCheck", id);
	}

	public Members emailCheck(String email) {
		return sessionTemplate.selectOne("Members.emailCheck", email);
	}

	public Members passCheck(String pass) {
		return sessionTemplate.selectOne("Members.passCheck", pass);
	}
	
	//회원가입, regist member
	public int insert(Members members) {
		return sessionTemplate.insert("Members.insert", members);
	}
	//회원정보 수정,갱신, update(modify) member's info
	public int update(Members members) {
		return sessionTemplate.update("Members.update", members);
	}
	//회원삭제, delete member
	public int delete(int member_id) {
		return sessionTemplate.delete("Members.delete", member_id);
	}
	
	public Members loginCheck(Members members) {
		return sessionTemplate.selectOne("Members.loginCheck",members);
	}

	public Members findId(Members members) {
		return sessionTemplate.selectOne("Members.findId",members);
	}
	
	public int resetPass(Members members) {
		return sessionTemplate.update("Members.resetPass",members);
	}
	
	public Members infoCheck(Members members) {
		return sessionTemplate.selectOne("Members.infoCheck",members);
	}
	//권한변경
	public int updateAuth(Members members) {
		return sessionTemplate.selectOne("Members.updateAuth", members);
	}
	
	/*
	public int lastLogin(Members members) {
		return sessionTemplate.selectOne("Members.lastLogin", members);
	}
	*/
	public List<Members> search(String searchWord) {
		return sessionTemplate.selectList("Members.search", searchWord);
	}

}
