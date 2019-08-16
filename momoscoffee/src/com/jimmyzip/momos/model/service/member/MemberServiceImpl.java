package com.jimmyzip.momos.model.service.member;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.exception.RegistFailException;
import com.jimmyzip.momos.model.domain.member.Members;
import com.jimmyzip.momos.model.repository.member.MemberDAO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	@Qualifier("mybatisMemberDAO")
	private MemberDAO memberDAO;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public List<Members> selectAll() {
		return memberDAO.selectAll();
	}

	public List<Members> selectByAuth(int auth_id) {
		return memberDAO.selectByAuth(auth_id);
	}

	public Members select(int member_id) {
		return memberDAO.select(member_id);
	}

	public Members selectById(String id) {
		return memberDAO.selectById(id);
	}

	public Members loginCheck(Members members) {
		return memberDAO.loginCheck(members);
	}

	public Members idCheck(String id) {
		System.out.println("도달하는가");
		return memberDAO.idCheck(id);
	}

	public Members emailCheck(String email) {
		return memberDAO.emailCheck(email);
	}

	public Members passCheck(String pass) {
		return memberDAO.passCheck(pass);
	}

	public void insert(Members members) throws RegistFailException{
		int result = memberDAO.insert(members);
		if(result==0) {
			throw new RegistFailException("회원가입 실패. 정보를 확인해주세요");
		}
	}

	public void update(Members members) throws EditFailException{
		int result = memberDAO.update(members);
		if(result==0) {
			throw new EditFailException("회원정보 수정에 실패했습니다.");
		}
	}

	public void delete(int member_id) throws DeleteFailException{
		int result = memberDAO.delete(member_id);
		if(result==0) {
			throw new DeleteFailException("회원 삭제 실패");
		}
	}

	public Members findId(Members members) {
		return memberDAO.findId(members);
	}
	
	public int resetPass(Members members) throws EditFailException{
		int result = memberDAO.resetPass(members);
		if(result==0) {
			throw new EditFailException("비밀번호 재설정 실패에 실패했습니다.");
		}
		return result;
	}
	
	//@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public Members infoCheck(Members members) {
		return memberDAO.infoCheck(members);
	}
	
	//인증 이메일 발송
	public boolean send(String subject, String text, String from, String to) {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true,"UTF-8");
			helper.setSubject(subject);
			helper.setText(text,true);
			helper.setFrom(from);
			helper.setTo(to);
			
			javaMailSender.send(message);
			return true;
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	public void updateAuth(Members members) throws EditFailException{
		int result = memberDAO.updateAuth(members);
		if(result==0) {
			throw new EditFailException("권한 수정에 실패하였습니다.");
		}
	}

	/*
	public void lastLogin(Members members) throws EditFailException{
		int result = memberDAO.lastLogin(members);
		if(result==0) {
			throw new EditFailException("마지막 로그인 기록이 남지 않았습니다.");
		}
	}
	 */
	public List<Members> search(String searchWord) {
		return memberDAO.search(searchWord);
	}

}
