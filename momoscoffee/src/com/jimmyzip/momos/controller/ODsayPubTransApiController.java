package com.jimmyzip.momos.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmyzip.momos.model.service.ODsayPubTransService;

@Controller
public class ODsayPubTransApiController {
	@Autowired
	ODsayPubTransService pubTransService;
	
	@RequestMapping(value="/api/transinfo",method=RequestMethod.GET,produces = "application/json; charset=utf8")
	@ResponseBody
	public String getPubTransInfo(@RequestParam(value="latlongArray[]") List<Double> latlongArray) {
		System.out.println("주변대중교통 정보 달라고 요청 넘어옴");
		System.out.println("latlongArray확인 : "+latlongArray.size());
		System.out.println("latlongArray 에서 lati확인 : "+latlongArray.get(0));
		System.out.println("latlongArray 에서 longi확인 : "+latlongArray.get(1));
		Double lati = latlongArray.get(0);
		Double longi = latlongArray.get(1);
		System.out.println("배열에서 추출해 담은 lati 확인 : "+lati);
		System.out.println("배열에서 추출해 담은 longi 확인 : "+longi);
		System.out.println("lati 자료형 확인 : "+lati.getClass().getName());
		System.out.println("longi 자료형 확인 : "+longi.getClass().getName());
		
		String apiResult = pubTransService.getPubTransInfo(lati, longi);
		//return apiResult.toString();
		return apiResult.toString();
	}
}
