package com.jimmyzip.momos.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.common.Pager;
import com.jimmyzip.momos.model.domain.product.Subcategory;
import com.jimmyzip.momos.model.domain.product.Topcategory;
import com.jimmyzip.momos.model.service.product.ProductService;
import com.jimmyzip.momos.model.service.product.SubcategoryService;
import com.jimmyzip.momos.model.service.product.TopcategoryService;

@Controller
@RequestMapping("/admin")
public class AdminCategoryController {
	@Autowired
	TopcategoryService topcategoryService;
	@Autowired
	SubcategoryService subcategoryService;
	@Autowired
	ProductService productService;
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	Pager pager = new Pager();
	
	//관리 페이지로 이동
	@RequestMapping(value="/category/page",method=RequestMethod.GET)
	public ModelAndView showCategory(HttpServletRequest request) {
		//logger.trace("카테고리 관리 페이지로 이동");
		ModelAndView mav = new ModelAndView("admin/admin_category");
		return mav;
	}
	
	//전체목록 요청
	@RequestMapping(value="/category",method=RequestMethod.GET)
	@ResponseBody
	public String selectAll(HttpServletRequest request) {		
		logger.trace("카테고리 전체목록 요청");
		List<Topcategory> topCateList = topcategoryService.selectAll();
		request.getSession().setAttribute("topCateList", topCateList);
		List<Subcategory> subCateList = subcategoryService.selectAll();
		request.getSession().setAttribute("subCateList", subCateList);

		JSONArray totalArray = new JSONArray();
		JSONArray jsonTopArray = new JSONArray();
		JSONArray jsonSubArray = new JSONArray();
		for(int i=0;i<topCateList.size();i++) {
			Topcategory top = topCateList.get(i);
			JSONObject json_top = new JSONObject();
			json_top.put("topcategory_id", top.getTopcategory_id());
			json_top.put("topcate_name",top.getTopcate_name());		
			jsonTopArray.add(json_top);
		}
		
		if(subCateList.size()!=0) {
			for(int j=0;j<subCateList.size();j++) {
				Subcategory sub = subCateList.get(j);
				JSONObject json_sub = new JSONObject();
				json_sub.put("subcategory_id", sub.getSubcategory_id());
				json_sub.put("topcategory_id", sub.getTopcategory().getTopcategory_id());
				json_sub.put("topcate_name",sub.getTopcategory().getTopcate_name());
				json_sub.put("subcate_name", sub.getSubcate_name());
				jsonSubArray.add(json_sub);
			}
		}else {
			JSONObject json_sub = new JSONObject();
			json_sub.put("subcategory_id", 0);
			json_sub.put("topcategory_id",0);
			json_sub.put("subcate_name","undefined");
			jsonSubArray.add(json_sub);
		}
		
		totalArray.add(jsonTopArray);
		totalArray.add(jsonSubArray);
		
		return totalArray.toString();
	}
	
	//상위분류만 요청
	@RequestMapping(value="/category/top",method=RequestMethod.GET)
	@ResponseBody
	public String selectOnlyTop() {
		List<Topcategory> topCateList = topcategoryService.selectAll();
		
		JSONArray topArray = new JSONArray();
		for(Topcategory top:topCateList) {
			JSONObject json_top = new JSONObject();
			json_top.put("topcategory_id", top.getTopcategory_id());
			json_top.put("topcate_name",top.getTopcate_name());		
			topArray.add(json_top);
		}
		
		return topArray.toString();
	}
	
	//상위분류별 하위목록 요청
	@RequestMapping(value="/category/sort/{topcategory_id}",method=RequestMethod.GET)
	@ResponseBody
	public String selectByTopId(@PathVariable("topcategory_id") int topcategory_id,HttpServletRequest request) {
		System.out.println("넘겨받은 top_id : "+topcategory_id);
		List<Subcategory> subSortList = subcategoryService.selectAllByFk(topcategory_id);
		JSONArray subSortArray = new JSONArray();
		for(int i=0;i<subSortList.size();i++) {
			Subcategory sub = subSortList.get(i);
			JSONObject json_sub = new JSONObject();
			json_sub.put("subcategory_id", sub.getSubcategory_id());
			json_sub.put("topcategory_id", sub.getTopcategory().getTopcategory_id());
			json_sub.put("topcate_name",sub.getTopcategory().getTopcate_name());
			json_sub.put("subcate_name", sub.getSubcate_name());
			subSortArray.add(json_sub);
		}
		return subSortArray.toString();
	}
	
	//상위카테고리 등록
	@RequestMapping(value="/category/top",method=RequestMethod.POST)
	@ResponseBody
	public String topcateInsert(HttpServletRequest request, Topcategory topcategory) {
		logger.trace("상위카테고리 등록 요청");
		//등록 전 이름 겹치는지 확인
		Topcategory top = topcategoryService.cateNameCheck(topcategory.getTopcate_name());
		StringBuffer sb = new StringBuffer();
		if(top==null) {
			topcategoryService.insert(topcategory);
			sb.append("{");
			sb.append("\"result\":1");
			sb.append("}");
		}else {
			sb.append("{");
			sb.append("\"result\":0");
			sb.append("}");
		}
		
		return sb.toString();
	}
	
	//하위카테고리 등록
	@RequestMapping(value="/category/sub",method=RequestMethod.POST)
	@ResponseBody
	public String subcateInsert(int topcategory_id, Subcategory subcategory) {
		System.out.println("등록하라고 받은 서브카테명 : "+subcategory.getSubcate_name());
		Topcategory topcategory = topcategoryService.select(topcategory_id);
		//등록 전 이름 겹치는지 확인
		Subcategory sub = subcategoryService.cateNameCheck(subcategory.getSubcate_name());
		StringBuffer sb = new StringBuffer();
		if(sub==null) {
			subcategory.setTopcategory(topcategory);
			subcategoryService.insert(subcategory);
			sb.append("{");
			sb.append("\"result\":1");
			sb.append("}");
		}else {
			sb.append("{");
			sb.append("\"result\":0");
			sb.append("}");
		}
		return sb.toString();
	}
	
	//상위카테고리 삭제
	@RequestMapping(value="/category/top/{topcategory_id}",method=RequestMethod.DELETE)
	@ResponseBody
	public String topcateDelete(@PathVariable("topcategory_id") int topcategory_id) {
		System.out.println("전달받은 topcategory_id"+topcategory_id);
		topcategoryService.delete(topcategory_id);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//하위카테고리 삭제
	@RequestMapping(value="/category/sub/{subcategory_id}",method=RequestMethod.DELETE)
	@ResponseBody
	public String subcateDelete(@PathVariable("subcategory_id") int subcategory_id) {
		subcategoryService.delete(subcategory_id);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//상위카테고리 수정
	@RequestMapping(value="/category/top",method=RequestMethod.PUT)
	@ResponseBody
	public String topcateEdit(Topcategory topcategory) {
		System.out.println("넘겨받은 top_id : "+topcategory.getTopcategory_id());
		System.out.println("넘겨받은 top_name : "+topcategory.getTopcate_name());
		topcategoryService.update(topcategory);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//하위카테고리 수정
	@RequestMapping(value="/category/sub/{newTopName}",method=RequestMethod.PUT)
	@ResponseBody
	public String subcateEdit(@PathVariable("newTopName") String newTopName, Subcategory subcategory) {
		//(subcategory.getTopcategory().getTopcategory_id())
		Topcategory top = topcategoryService.selectByName(newTopName);
		subcategory.setTopcategory(top);
		subcategoryService.update(subcategory);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
}
