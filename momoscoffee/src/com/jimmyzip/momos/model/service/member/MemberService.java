package com.jimmyzip.momos.model.service.member;

import java.util.List;

import com.jimmyzip.momos.model.domain.member.Members;

public interface MemberService {
	public List<Members> selectAll();
	public List<Members> selectByAuth(int auth_id);
	public Members select(int member_id);
	public Members selectById(String id);
	public Members loginCheck(Members members);
	public Members idCheck(String id);
	public Members emailCheck(String email);
	public Members passCheck(String pass);
	public void insert(Members members);
	public void update(Members members);
	public void delete(int member_id);
	public Members findId(Members members);
	public int resetPass(Members members);
	public Members infoCheck(Members members);
	public boolean send(String subject,String text,String from,String to);
	public void updateAuth(Members members);
	//public void lastLogin(Members members);
	public List<Members> search(String searchWord);
}
