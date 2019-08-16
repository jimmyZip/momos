package com.jimmyzip.momos.controller.admin;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmyzip.momos.model.service.ExcelService;
import com.sun.net.httpserver.HttpContext;

@Controller
public class ExcelController {

	@Autowired
	ExcelService excelService;
	
	@RequestMapping(value="/excelDownload",method=RequestMethod.GET)
	//@ResponseBody
	public String excelTransform(@RequestParam Map<String, Object> paramMap, Map<String, Object> ModelMap, HttpServletResponse response) throws Exception{
		System.out.println("엑셀 다운로드 받겠다고 컨트롤러 요청 받았다.");
		System.out.println("paramMap이 뭐가 넘어오나?"+paramMap);
		/*
		 * excelDownload?target=product&product_id=00같은 형식으로 파라미터 받을 예정
		 * target에 따라 가져올 리스트를 선택한다.
		 * */
		String target = paramMap.get("target").toString();
		//response.setHeader("Content-disposition", "attachment; filename="+target+".xlsx");//target명을 파일명으로 작성
		//response.setHeader("Content-disposition", "attachment; filename="+target+".xls");//target명을 파일명으로 작성
		response.addHeader("Content-Disposition", "attachment; filename="+target+".xlsx");//target명을 파일명으로 작성
		//response.addHeader("Content-Disposition","attachment;filename=product"); 
		
		//엑셀에 작성할 리스트를 받음
		List<Object> excelList = excelService.getAllObjects(target, paramMap);
		System.out.println("excelController에서 excelList size확인 : "+excelList.size());
		//ExcelView에 넘겨줄 값 세팅(com.jimmyzip.momos.common.ExcelView)에 넘길 값
		ModelMap.put("excelList", excelList);
		ModelMap.put("target", target);
		
		return "excelView"; 
		//servlet-context.xml에서 name이 excelView(com.jimmyzip.momos.common.ExcelView)인것 호출
	}
}
