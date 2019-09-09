package com.jimmyzip.momos.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.common.Pager;
import com.jimmyzip.momos.common.SecurityBean;
import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.model.domain.member.Auth;
import com.jimmyzip.momos.model.domain.member.Members;
import com.jimmyzip.momos.model.service.member.AuthService;
import com.jimmyzip.momos.model.service.member.MemberService;

@Controller
public class AdminMemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	AuthService authService;
	@Autowired
	SecurityBean security;
	
	Pager pager = new Pager();
	
	//로그인 페이지 이동
	@RequestMapping(value="/admin/goLogin",method=RequestMethod.GET)
	public String goLogin(HttpServletRequest request) {
		/*
		Members admin = (Members)request.getSession().getAttribute("admin");
		String viewName = null;
		
		if(admin==null) {
			viewName = "admin/login/login";
		}else {
			//viewName = "admin/admin_main";
			String prev = request.getHeader("referer");
			viewName = "redirect:"+prev;
			
		}
		return viewName;
		*/
		return "admin/login/login";
	}
	
	//admin 로그인 요청
	@RequestMapping(value="/admin/login",method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,Members members) {
		members.setUserpass(security.textToHash(members.getUserpass()));
		Members admin = memberService.loginCheck(members);
		ModelAndView mav = null;
		if(admin!=null) {
			mav = new ModelAndView("admin/admin_main");
			request.getSession().setAttribute("admin", admin);
			System.out.println("admin로그인해서 세션에 담았나 확인 : "+request.getSession().getAttribute("admin"));
		}else {
			mav = new ModelAndView("admin/login/login_error_auth");
		}
		return mav;
	}
	
	//admin logout
	@RequestMapping(value="/admin/logout",method=RequestMethod.GET)
		public String logout(HttpServletRequest request) {
			request.getSession().invalidate();
			return "redirect:/";
		}
	
	//관리자 페이지에서 회원전체목록 또는 검색된 회원 조회
	@RequestMapping(value="/admin/member/page",method=RequestMethod.GET)
	public ModelAndView showMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_member");
		List<Members> memberList = null;
		//search 파라미터가 있는지 확인
		if(request.getParameter("search")!=null) {
			String searchWord = request.getParameter("search");
			if(searchWord.equals("")) {//검색이 있는지 확인해서 없으면 전부 출력
				memberList = memberService.selectAll();
			}else {
				memberList = memberService.search(searchWord);
			}
		}else {
			memberList=memberService.selectAll();
		}
		
		List<Auth> authList = authService.selectAll();
		pager.init(request, memberList.size());
		
		mav.addObject("memberList",memberList);
		mav.addObject("pager",pager);
		mav.addObject("authList", authList);
		
		return mav;
	}
	
	//관리자 페이지에서 회원삭제
	@RequestMapping(value="/admin/member/{member_id}",method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteMember(@PathVariable("member_id") int member_id) {
		memberService.delete(member_id);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}
	//관리자 페이지에서 회원권한 변경
	@RequestMapping(value="/admin/member/{member_id}/{auth_id}",method=RequestMethod.PUT)
	@ResponseBody
	public String updateAuthMember(@PathVariable("member_id") int member_id,@PathVariable("auth_id") int auth_id) {
		Members members = new Members();
		members.setAuth(new Auth());
		members.setMember_id(member_id);
		members.getAuth().setAuth_id(auth_id);
		memberService.updateAuth(members);
		
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}
	
	@ExceptionHandler(DeleteFailException.class)
	@ResponseBody
	public String deleteFail(DeleteFailException e) {
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}
	
	@ExceptionHandler(EditFailException.class)
	@ResponseBody
	public String updateFail(EditFailException e) {
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}
}
