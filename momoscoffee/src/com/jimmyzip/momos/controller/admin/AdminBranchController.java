package com.jimmyzip.momos.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.common.Pager;
import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.model.domain.branch.Branch;
import com.jimmyzip.momos.model.domain.branch.BranchImage;
import com.jimmyzip.momos.model.service.branch.BranchService;

@Controller
@RequestMapping("/admin")
public class AdminBranchController {
	@Autowired
	BranchService branchService;
	Pager pager = new Pager();
	
	//지점관리 페이지로 이동
	@RequestMapping(value="/branch/page",method=RequestMethod.GET)
	public ModelAndView showBranch(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_branch");
		return mav;
	}
	
	//지점 상세페이지 이동
	@RequestMapping(value="/branch/page/{branch_id}",method=RequestMethod.GET)
	public ModelAndView showBranchDetail(@PathVariable("branch_id") int branch_id,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_branch_detail");
		Branch b = branchService.select(branch_id);
		mav.addObject("branch_info", b);
		return mav;
	}
	
	//pk로 1건 조회
	@RequestMapping(value="/branch/{branch_id}",method=RequestMethod.GET)
	@ResponseBody
	public String select(@PathVariable("branch_id") int branch_id) {
		Branch b = branchService.select(branch_id);
		JSONObject json = new JSONObject();
		json.put("branch_id", b.getBranch_id());
		json.put("branch_name",b.getBranch_name());
		json.put("branch_addr", b.getBranch_addr());
		json.put("lati", b.getLati());
		json.put("longi", b.getLongi());
		json.put("message", b.getMessage());
		json.put("branch_tel", b.getBranch_tel());
		json.put("open_h", b.getOpen_h());
		json.put("close_h", b.getClose_h());
		json.put("last_order", b.getLast_order());
		if(b.getBranchImage().size()>0) {					
			json.put("branch_img", b.getBranchImage().get(0).getBranch_img());
		}else {
			json.put("branch_img","no_img.jpg");
		}
		return json.toString();
	}
	
	//지점 전체목록 요청
	@RequestMapping(value="/branch",method=RequestMethod.GET)
	@ResponseBody
	public String showAllBranch(HttpServletRequest request) {
		System.out.println("컨트롤러에 지점 전체목록 요청");
		List<Branch> branchList = branchService.selectAll();
		JSONArray totalArray = new JSONArray();
	
		for(Branch b : branchList) {
			JSONObject json_b = new JSONObject();
			json_b.put("branch_id", b.getBranch_id());
			json_b.put("branch_name",b.getBranch_name());
			json_b.put("branch_addr", b.getBranch_addr());
			json_b.put("lati", b.getLati());
			json_b.put("longi", b.getLongi());
			json_b.put("message", b.getMessage());
			json_b.put("branch_tel", b.getBranch_tel());
			json_b.put("open_h", b.getOpen_h());
			json_b.put("close_h", b.getClose_h());
			json_b.put("last_order", b.getLast_order());
			if(b.getBranchImage().size()>0) {					
				json_b.put("branch_img", b.getBranchImage().get(0).getBranch_img());
			}else {
				json_b.put("branch_img","no_img.jpg");
			}
			totalArray.add(json_b);
		}
		
		return totalArray.toString();
	}
	
	//이미지 목록 가져오기
	@RequestMapping(value="/branch/img",method=RequestMethod.GET)
	@ResponseBody
	public String getImgList() {
		List<BranchImage> imgList = branchService.getImg();
		return imgList.toString();
	}
	
	//지점 등록
	@RequestMapping(value="/branch",method=RequestMethod.POST)
	@ResponseBody
	public String regist(Branch branch,BranchImage branchImage,HttpServletRequest request) {
		System.out.println("지점등록 요청");
		String path = request.getServletContext().getRealPath("/data");
		branchService.insert(branch, branchImage, path);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//지점정보 수정
	@RequestMapping(value="/branch/update",method=RequestMethod.POST)
	@ResponseBody
	public String updateBranch(Branch branch,BranchImage branchImage, HttpServletRequest request) {
		System.out.println("admin branch컨트롤러 지점정보 수정 요청 및 branch확인 : "+branch);
		//System.out.println("지점정보 수정하라고 전달받은 기존이미지 확인 : "+branchImage.getDeleteFile());
		//System.out.println("지점정보 수정하라고 전달받은 새 이미지 확인 : "+branchImage.getBranchFile());
		String path = request.getServletContext().getRealPath("/data");
		System.out.println("서비스한테 넘길 path확인 : "+path);
		branchService.update(branch, branchImage, path);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//선택한 지점정보 삭제
	@RequestMapping(value="/branch/del",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@RequestParam(value="checkArray[]") List<Integer> deleteList,HttpServletRequest request) {
		System.out.println("지점 삭제요청 받음");
		String path = request.getServletContext().getRealPath("/data");
		System.out.println("삭제 이미지 있는 실제경로 : "+path);
		List<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++) {
			deleteArray.add(deleteList.get(i));
		}
		branchService.delete(deleteArray, path);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//지점명 검색
	@RequestMapping(value="/branch/search/{searchWord}",method=RequestMethod.GET)
	@ResponseBody
	public String branchSearch(@PathVariable("searchWord") String searchWord) {
		System.out.println(searchWord+"가 컨트롤러로 넘어와 지점 검색요청");
		List<Branch> searchedList = branchService.search(searchWord);
		JSONArray searchResultArray = new JSONArray();
		
		for(Branch b : searchedList) {
			JSONObject json_b = new JSONObject();
			json_b.put("branch_id", b.getBranch_id());
			json_b.put("branch_name",b.getBranch_name());
			json_b.put("branch_addr", b.getBranch_addr());
			json_b.put("lati", b.getLati());
			json_b.put("longi", b.getLongi());
			json_b.put("message", b.getMessage());
			json_b.put("branch_tel", b.getBranch_tel());
			json_b.put("open_h", b.getOpen_h());
			json_b.put("close_h", b.getClose_h());
			json_b.put("last_order", b.getLast_order());
			if(b.getBranchImage().size()>0) {					
				json_b.put("branch_img", b.getBranchImage().get(0).getBranch_img());
			}else {
				json_b.put("branch_img","no_img.jpg");
			}
			searchResultArray.add(json_b);
		}
		
		return searchResultArray.toString();
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
