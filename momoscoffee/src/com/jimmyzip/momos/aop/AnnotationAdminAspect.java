package com.jimmyzip.momos.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.model.domain.member.Auth;
import com.jimmyzip.momos.model.domain.member.Members;

@Service
@Aspect //Aspect = Pointcut + Advice
public class AnnotationAdminAspect {
	//Pointcut
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminAssign*.showAuth(..))")
	public void checkAssign() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminMember*.showMember(..))")
	public void checkMember() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminProduct*.showProduct(..))")
	public void checkProduct() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminBranch*.showBranch*(..))")
	public void checkBranch() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminBoard*.showBoard(..))")
	public void checkBoard() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminCategory*.showCategory(..))")
	public void checkCategory() {}
	
	@Around("checkAssign()")
	public ModelAndView assignCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();//메서드 호출 시 전달된 매개변수를 반환
		
		for (Object obj : objArray) {//objArray에서 obj에 담아 하나씩 전수조사, 모든 매개변수를 조사하겠다는 의미
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}
		}

		Members members = (Members) request.getSession().getAttribute("admin");//null에서 뽑아오니 역시 null
		if (members != null) {
			Auth auth = members.getAuth();
			if(auth.isAdmin_assign()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	
	@Around("checkMember()")
	public ModelAndView memberCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();
		
		for(Object obj:objArray) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		Members members = (Members)request.getSession().getAttribute("admin");
		if(members!=null) {
			Auth auth = members.getAuth();
			if(auth.isMember_del()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	
	@Around("checkProduct()")
	public ModelAndView productCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();
		
		for(Object obj:objArray) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		Members members = (Members)request.getSession().getAttribute("admin");
		if(members!=null) {
			Auth auth = members.getAuth();
			if(auth.isProduct_del()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	
	@Around("checkBranch()")
	public ModelAndView branchCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();
		
		for(Object obj:objArray) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		Members members = (Members)request.getSession().getAttribute("admin");
		if(members!=null) {
			Auth auth = members.getAuth();
			if(auth.isBranch_del()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	
	@Around("checkBoard()")
	public ModelAndView boardCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();
		
		for(Object obj:objArray) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		Members members = (Members)request.getSession().getAttribute("admin");
		if(members!=null) {
			Auth auth = members.getAuth();
			if(auth.isBoard_del()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	
	@Around("checkCategory()")
	public ModelAndView categoryCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();
		
		for(Object obj:objArray) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		Members members = (Members)request.getSession().getAttribute("admin");
		if(members!=null) {
			Auth auth = members.getAuth();
			if(auth.isCategory_del()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	
	//되돌려보낼 페이지
	private String getIndex() {
		return "admin/login/login_error_auth";
	}	
}
