package com.jimmyzip.momos.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.common.SecurityBean;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.exception.LoginFailException;
import com.jimmyzip.momos.exception.RegistFailException;
import com.jimmyzip.momos.model.domain.member.JoinCode;
import com.jimmyzip.momos.model.domain.member.Members;
import com.jimmyzip.momos.model.service.member.MemberService;

@Controller
//@RequestMapping("/rest")//공통
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	SecurityBean security;
	     
	//로그인 페이지로 이동
	@RequestMapping(value="/member/goLogin",method=RequestMethod.GET)
	public ModelAndView goLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/member/login");
		return mav;
	}

	//회원가입으로 이동
	@RequestMapping(value="/member/goRegist",method=RequestMethod.GET)
	public String goRegist() {
		return "client/member/regist";
	}
	
	//회원가입 요청
	@RequestMapping(value="/member/regist",method=RequestMethod.POST)
	@ResponseBody
	public String regist(Members members) {
		members.setUserpass(security.textToHash(members.getUserpass()));
		memberService.insert(members);
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('회원가입을 환영합니다.');");
		sb.append("location.href='/member/goLogin';");
		sb.append("</script>");
		//return "redirect:/index.jsp";
		//return "redirect:/member/goLogin";
		return sb.toString();
	}
	
	//중복가입 확인
	@RequestMapping(value="/member/idCheck",method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(String id) {
		System.out.println("중복체크하라고 넘겨받은 아이디 : "+id);
		Members members = memberService.idCheck(id);
		if(members!=null) {
			System.out.println(members);
			return "{\"msg\":\"중복된 아이디입니다.\",\"result\":0} ";
		}else {
			return "{\"msg\":\"사용가능한 아이디입니다.\",\"result\":1} ";
		}
	}
	
	//회원정보 1건 조회
	@RequestMapping(value="/member/{member_id}",method=RequestMethod.GET)
	@ResponseBody
	public String selectMember(@PathVariable("member_id") int member_id) {
		Members members = memberService.select(member_id);
		JSONObject obj = new JSONObject();
		obj.put("member_id", members.getMember_id());
		obj.put("auth_id", members.getAuth().getAuth_id());
		obj.put("userid", members.getUserid());
		obj.put("userpass", members.getUserpass());
		obj.put("usermail", members.getUsermail());
		obj.put("userphone", members.getUserphone());
		obj.put("add1", members.getAdd1());
		obj.put("add2", members.getAdd2());
		obj.put("post1", members.getPost1());
		obj.put("post2", members.getPost2());
		obj.put("post3", members.getPost3());
		return obj.toString();
	}
	
	//로그인 요청
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String login(Members members,HttpServletRequest request) {
		String viewName = null;
		members.setUserpass(security.textToHash(members.getUserpass()));
		Members obj = memberService.loginCheck(members);
		String prev = request.getHeader("referer");
		System.out.println("로그인 이전에 있던 페이지 정보 : "+prev);
		//아래 두 줄은 last login체크용
		//Date d = new Date();
		//java.sql.Date sqlDate = new java.sql.Date(d.getTime());
		
		if(obj!=null) {
			request.getSession().setAttribute("members", obj);
			if(obj.getAuth().getAuth_name().contains("admin")) {//obj.getAuth().getAuth_id()==2와 동일
				request.getSession().setAttribute("admin", obj);
			}
			if(prev.contains("member/goLogin")) {				
				viewName="redirect:/";
			}else {
				viewName="redirect:"+prev;
			}
		}else {
			viewName = "member/login/loginfail";			
		}
		return viewName;
	}
	
	//로그아웃
	@RequestMapping(value="/member/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	//아이디 찾기
	@RequestMapping(value="/member/findId",method=RequestMethod.POST)
	@ResponseBody
	public String findId(Members members) {
		Members obj = memberService.findId(members);
		if(obj!=null) {
			return "{\"msg\":\""+obj.getUserid()+"\",\"result\":1}";
		}else {
			return "{\"msg\":\"일치하는 아이디가 없습니다.\",\"result\":0}";
		}
	}
	
	//비밀번호 재설정 용도 이메일 발송 직전 아이디, 이메일 가입자여부 확인
	@RequestMapping(value="/member/infoCheck/{userid}/{usermail}/",method=RequestMethod.GET)
	@ResponseBody
	public String infoCheck(@PathVariable(value="userid") String userid,@PathVariable(value="usermail") String usermail,HttpSession session) {
		System.out.println("넘겨받은 아이디 : "+userid);
		System.out.println("넘겨받은 이메일 : "+usermail);
		Members members = new Members();
		members.setUserid(userid);
		members.setUsermail(usermail);
		System.out.println("members.getUserid : "+members.getUserid());
		System.out.println("members.getUsermail : "+members.getUsermail());
		Members obj = memberService.infoCheck(members);
		System.out.println("infoCheck결과 : "+obj);
		if(obj!=null) {
			session.setAttribute("id", obj.getUserid());
			session.setAttribute("email", obj.getUsermail());
			return "{\"msg\":\"회원확인 완료. 인증메일 발송에 약 3초의 시간이 소요됩니다.\",\"result\":1}";
		}else {
			return "{\"msg\":\"회원 정보가 없습니다.\",\"result\":0}";
		}
	}
	//비밀번호 재설정 용도의 이메일 발송
	@RequestMapping(value="/member/sendMail",method=RequestMethod.POST)
	@ResponseBody
	public boolean sendMail(HttpServletRequest request, HttpSession session) {
		JoinCode joinCode = new JoinCode();
		int randomCode = new Random().nextInt(10000)+1000;
		String num=String.valueOf(randomCode);
		joinCode.setId((String)request.getSession().getAttribute("id"));
		joinCode.setEmail((String)request.getSession().getAttribute("email"));
		joinCode.setNum(num);
		session.setAttribute("joinCode", joinCode);
		//System.out.println("joinCode에 잘 담겼나 확인"+session.getAttribute("joinCode"));
		String subject="비밀번호 재설정 승인번호입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("비밀번호 재설정 승인번호는 ").append(joinCode.getNum()).append(" 입니다.");
		
		return memberService.send(subject, sb.toString(), "wlsghd1028@naver.com", joinCode.getEmail());
	}
	
	//인증코드 확인
	@RequestMapping(value="/member/codeCheck",method=RequestMethod.POST)
	@ResponseBody
	public String codeCheck(HttpSession session, JoinCode clientJoinCode) {
		JoinCode sendedCode = (JoinCode)session.getAttribute("joinCode");
		if(clientJoinCode.getId().equals(sendedCode.getId())) {
			if(clientJoinCode.getNum().equals(sendedCode.getNum())) {
				return "{\"msg\":\"승인코드 일치\",\"result\":1}";
			}else {
				return "{\"msg\":\"승인코드 불일치\",\"result\":0}";
			}
		}else {
			return "{\"msg\":\"아이디확인오류\",\"result\":2}";
		}
	}
	
	//비밀번호 재설정
	@RequestMapping(value="/member/resetpw",method=RequestMethod.POST)
	@ResponseBody
	public String resetPass(Members members) {
		members.setUserpass(security.textToHash(members.getUserpass()));
		int result = memberService.resetPass(members);
		if(result==1){
			return "{\"msg\":\"비밀번호 재설정 성공\",\"result\":1}";
		}else {
			return "{\"msg\":\"비밀번호 재설정 실패\",\"result\":0}";
		}
	}
	
	//회원정보 수정
	@RequestMapping(value="/member/edit",method=RequestMethod.POST)
	@ResponseBody
	public String edit(Members members,HttpServletRequest request) {
		members.setUserpass(security.textToHash(members.getUserpass()));
		memberService.update(members);
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('회원 정보가 수정되었습니다.');");
		sb.append("location.href='/member/mypage/{currentPage}';");
		sb.append("</script>");
		return sb.toString();
	}
	
	//회원삭제
	@RequestMapping(value="/admin/member/delete",method=RequestMethod.GET)
	public String del(int member_id) {
		memberService.delete(member_id);
		return "redirect:/admin/memberList";
	}
	
	@ExceptionHandler(RegistFailException.class)
	@ResponseBody
	public String handleRegistFail(RegistFailException e) {
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}
	@ExceptionHandler(EditFailException.class)
	@ResponseBody
	public String handleEditFail(EditFailException e) {
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}
	@ExceptionHandler(LoginFailException.class)
	@ResponseBody
	public String handleLoginFail(LoginFailException e) {
		
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}
}
