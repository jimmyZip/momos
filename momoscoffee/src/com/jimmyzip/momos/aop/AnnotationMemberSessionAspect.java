package com.jimmyzip.momos.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AnnotationMemberSessionAspect {
	@Pointcut("execution(public * com.jimmyzip.momos.controller.MemberController..*(..))") // 멤버 컨트롤러 한정 캐치
	public void checkMember() {
	}// 이 메서드가 아이디 역할

	// 세션체크 예외대상
	String[] exceptList = { 
			"/member/goLogin",
			"/member/contact", 
			"/member/codeCheck"
	};

	// 공통로직
	// aop advice는 pointcut의 id를 참조하기 때문에 그 id 역할을 하는 메서드를 명시한다.
	// 어노테이션 기반으로 명시하는 advice는 around 키워드
	// 로그인이 필요한 호출만을 대상으로 세션보유 여부를 체크하며 판단기준은 HttpServletRequest가 넘어오는가 여부
	@Around("checkMember()")
	public String loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("AnnotationMemberSessionAspect클래스에서 proxy로 멤버체크시작");
		String viewName = null;
		HttpServletRequest request = null;
		int count = 0;// 세션체크 예외대상 명단에 걸리면 증가시킬 변수
		Object[] objArray = joinPoint.getArgs();// 메서드 호출 시 전달된 매개변수를 반환
		String requestURL = null;
		for (Object obj : objArray) {//모든 매개변수에 대해 리퀘스트 객체인지 여부 조사
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
				requestURL = request.getRequestURL().toString();
				System.out.println("현재 들어온 요청은 : "+requestURL);
				requestURL.endsWith("/member/login");
				for(int i=0;i<exceptList.length;i++) {
					if(requestURL.endsWith(exceptList[i])) {
						count++;//예외대상 발견
					}
				}
			}
		}
		
		//로그인이 필요한 호출에 대해서만 세션체크
		if(request!=null && count==0) {//HttpServletRequest가 넘어왔고, 예외대상이 아니라면
			if(request.getSession().getAttribute("member")==null) {
				viewName = "member/login/error";
				String methodName = joinPoint.getSignature().getName();
				System.out.println("로그인이 필요한 서비스입니다. 원래 호출된 메서드는 "+methodName+"이며 반환값은 "+viewName);
			}else {
				viewName = (String)joinPoint.proceed();
				String methodName = joinPoint.getSignature().getName();
			}
		}else {
			viewName = (String)joinPoint.proceed();
			String methodName = joinPoint.getSignature().getName();
			System.out.println("로그인하지 않아도 호출되는 서비스입니다. 호출된 원래 메서드는 "+methodName+"이며 반환값은 "+viewName);
		}
		
		return viewName;
	}
}
