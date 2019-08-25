package com.jimmyzip.momos.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmyzip.momos.model.service.NaverApiService;

@Controller
public class NaverApiController {
	
	@Autowired
	NaverApiService apiService;
	
	@RequestMapping(value="/api/addr",method=RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String trans(String address) {
		System.out.println("주소로 좌표검색 컨트롤러 요청");
		System.out.println("서비스단에 넘길 파라미터 address확인 : "+address);
		String apiResult = null;
		apiResult = apiService.coordSearch(address);
		
		System.out.println("컨트롤러에서 클라이언트로 반환 직전 확인한 apiReslt : "+apiResult);
		System.out.println("컨트롤러에서 클라이언트로 반환 직전 확인한 apiReslt.toString() : "+apiResult.toString());
		
		return apiResult.toString();
	}
	
}
