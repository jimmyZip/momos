package com.jimmyzip.momos.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.model.domain.branch.Branch;
import com.jimmyzip.momos.model.service.branch.BranchService;

@Controller
@RequestMapping("/client")
public class BranchController {
	@Autowired
	BranchService branchService;
	
	//ABOUT 하위 location.jsp이동 시 지점 전체목록 가지고 가기
	@RequestMapping(value="/goLocation",method=RequestMethod.GET)
	public ModelAndView goLocationPage() {
		System.out.println("클라이언트페이지에서 about 하위 location.jsp이동 요청받음");
		ModelAndView mav = new ModelAndView("client/pages/location");
		List<Branch> branchList = branchService.selectAll();
		mav.addObject("branchList", branchList);
		return mav;
	}
	
	@RequestMapping(value="/goLocation/{branch_id}",method=RequestMethod.GET)
	public ModelAndView goLocationSubPage(@PathVariable("branch_id") int branch_id) {
		ModelAndView mav = new ModelAndView("client/pages/branch_detail");
		Branch b = branchService.select(branch_id);
		List<Branch> allBranchList = branchService.selectAll();
		mav.addObject("branch_info",b);
		mav.addObject("allBranchList",allBranchList);
		return mav;
	}
}
