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
@Aspect
public class AnnotationAdminAspect {
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminAssign*.showAuth(..))")
	public void checkAssign() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminMember*.showMember(..))")
	public void checkMember() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminReviewCon*.show*(..))")
	public void checkReview() {}
	@Pointcut("execution(public * com.jimmyzip.momos.controller.admin.AdminReviewCom*.show*(..))")
	public void checkComment() {}
	
	@Around("checkAssign()")
	public ModelAndView assignCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = null;
		HttpServletRequest request = null;
		System.out.println("joinPoint확인 "+joinPoint.getArgs());
		Object[] objArray = joinPoint.getArgs();//메서드 호출 시 전달된 매개변수를 반환
		System.out.println("AdminAspect에서 확인 : joinPoint.getArgs담은 objArray"+objArray);
		
		for (Object obj : objArray) {//objArray에서 obj에 담아 하나씩 전수조사, 모든 매개변수를 조사하겠다는 의미
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
					//이 request 확인해보니 null, 원인 : 실수로 AdminAssignController의 포인트컷 대상 메서드 매개변수를 잘못적음
			}
		}
		System.out.println("objArray에서 꺼내 obj에 잘 담았나 request 확인 : "+request);//null

		//Members members = (Members) request.getSession().getAttribute("members");
		Members members = (Members) request.getSession().getAttribute("admin");//null에서 뽑아오니 역시 null
		System.out.println("AdminAspect에서 확인한 멤버 세션을 가진 멤버 : "+members.getUserid());
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
	@Around("checkReview()")
	public ModelAndView reviewCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();
		
		for(Object obj : objArray) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		
		Members members = (Members)request.getSession().getAttribute("admin");
		if(members!=null) {
			Auth auth = members.getAuth();
			if(auth.isReview_del()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	@Around("checkComment()")
	public ModelAndView commentCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		ModelAndView mav = null;
		HttpServletRequest request = null;
		
		Object[] objArray = joinPoint.getArgs();
		
		for(Object obj : objArray) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		
		Members members = (Members)request.getSession().getAttribute("admin");
		if(members!=null) {
			Auth auth = members.getAuth();
			if(auth.isReview_comment_del()) {
				mav = (ModelAndView)joinPoint.proceed();
			}else {
				mav = new ModelAndView(getIndex());
			}
		}else {
			mav = new ModelAndView(getIndex());
		}
		return mav;
	}
	
	
	private String getIndex() {
		return "admin/login_error";
	}
}
