package com.jimmyzip.momos.model.repository.member;

import java.util.List;

import com.jimmyzip.momos.model.domain.member.Members;

public interface MemberDAO {
	public List<Members> selectAll();
	public List<Members> selectByAuth(int auth_id);
	public Members select(int member_id);
	public Members idCheck(String id);
	public Members emailCheck(String email);
	public Members passCheck(String pass);
	public int insert(Members members);
	public int update(Members members);
	public int delete(int member_id);
	public Members loginCheck(Members members);
	public Members findId(Members members);
	public int resetPass(Members members);
	public Members infoCheck(Members members);
	public int updateAuth(Members members);
	//public int lastLogin(Members members);
	public Members selectById(String id);
	public List<Members> search(String searchWord);
}
