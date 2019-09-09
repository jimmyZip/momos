package com.jimmyzip.momos.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.common.Pager;
import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.exception.RegistFailException;
import com.jimmyzip.momos.model.domain.product.Product;
import com.jimmyzip.momos.model.domain.product.ProductImage;
import com.jimmyzip.momos.model.domain.product.Subcategory;
import com.jimmyzip.momos.model.domain.product.Topcategory;
import com.jimmyzip.momos.model.service.product.ProductService;
import com.jimmyzip.momos.model.service.product.SubcategoryService;
import com.jimmyzip.momos.model.service.product.TopcategoryService;


@Controller
@RequestMapping("/admin")
public class AdminProductController {
	@Autowired
	ProductService productService;
	@Autowired
	TopcategoryService topcategoryService;
	@Autowired
	SubcategoryService subcategoryService;
	Pager pager = new Pager();
	
	//상품관리 페이지 이동
	@RequestMapping(value="/product/page",method=RequestMethod.GET)
	public ModelAndView showProduct(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_product");
		return mav;
	}
	
	//전체 조회 :: selectAll역할
	//admin/product?currentPage=1&search='+data(검색기능) 함께 대응
	@RequestMapping(value="/product",method=RequestMethod.GET)
	@ResponseBody
	public String getAllProduct(HttpServletRequest request) {
		System.out.println("상품 컨트롤러 전체조회");
		List<Product> prodList = productService.selectAll();
		//search파라미터가 있는지 확인
		/*
		if(request.getParameter("prodSearch")!=null) {
			String searchWord = request.getParameter("prodSearch");
			if(searchWord.equals("")) {//검색어가 있는지 확인해서 없으면 전부출력
				prodList = productService.selectAll();
			}else {
				prodList = productService.search(searchWord);
			}
		}else {
			prodList = productService.selectAll();
		}
		*/
		List<Topcategory> topList = topcategoryService.selectAll();
		List<Subcategory> subList = new ArrayList<Subcategory>();
		for(Topcategory top:topList) {
			subList.addAll(subcategoryService.selectAllByFk(top.getTopcategory_id()));
		}
		
		JSONArray totalArray = new JSONArray();
		
		for(Product p:prodList) {
			JSONObject json_p = new JSONObject();
							
			for(Subcategory s:subList) {
				if(s.getSubcategory_id()==p.getSubcategory().getSubcategory_id()) {
					p.getSubcategory().setTopcategory(s.getTopcategory());
				}
			}
			json_p.put("product_id", p.getProduct_id());
			
			//json_p.put("topcategory_id", subcategoryService.select(p.getSubcategory().getSubcategory_id()).getTopcategory().getTopcategory_id());
			json_p.put("topcategory_id", p.getSubcategory().getTopcategory().getTopcategory_id());
			json_p.put("topcate_name", p.getSubcategory().getTopcategory().getTopcate_name());
			json_p.put("subcate_name", p.getSubcategory().getSubcate_name());
			json_p.put("prod_name_kor",p.getProd_name_kor());
			json_p.put("prod_name_eng",p.getProd_name_eng());
			json_p.put("price", p.getPrice());
			json_p.put("prod_desc", p.getProd_desc());
			json_p.put("stock", p.getStock());
			System.out.println("조회한 상품 이미지 확인 : "+p.getProductImage().size());
			if(p.getProductImage().size()>0) {				
				json_p.put("prod_img",p.getProductImage().get(0).getProd_img());//대표 이미지 하나만 뽑아오도록
			}else {
				json_p.put("prod_img","no_img.jpg");
			}
			totalArray.add(json_p);
		}
				
		return totalArray.toString();
	}
	
	//pk로 1건 조회
	@RequestMapping(value="/product/{product_id}",method=RequestMethod.GET)
	@ResponseBody
	public String select(@PathVariable("product_id") int product_id) {
		System.out.println("product_id : "+product_id+"받아서 상품정보 1건조회 호출");
		Product p = productService.select(product_id);
		//System.out.println("product 1건 select조회한 product 자체 확인 : "+p);
		//System.out.println("product 1건 select조회해서 얻은 prod_name 정보 확인 : "+p.getProd_name_kor());
		//System.out.println("product 1건 select조회해서 얻은 prod_name 정보 확인 : "+p.getProd_name_eng());
		//System.out.println("product 1건 select조회해서 얻은 price 정보 확인 : "+p.getPrice());
		//System.out.println("product 1건 select조회해서 얻은 prod_img 정보 확인 : "+p.getProductImage().get(0).getProd_img());
		//System.out.println("product 1건 select조회해서 얻은 prod_desc 정보 확인 : "+p.getProd_desc());
		//System.out.println("product 1건 select조회해서 얻은 sub_id정보 확인 : "+p.getSubcategory().getSubcategory_id());
		
		Subcategory sub = subcategoryService.select(p.getSubcategory().getSubcategory_id());
		if(sub.getSubcategory_id()==p.getSubcategory().getSubcategory_id()) {
			p.getSubcategory().setTopcategory(sub.getTopcategory());
		}
		JSONObject json = new JSONObject();
		json.put("topcategory_id", p.getSubcategory().getTopcategory().getTopcategory_id());
		json.put("subcategory_id", p.getSubcategory().getSubcategory_id());
		json.put("product_id", p.getProduct_id());
		json.put("prod_name_kor", p.getProd_name_kor());
		json.put("prod_name_eng", p.getProd_name_eng());
		json.put("price", p.getPrice());
		json.put("prod_img", p.getProductImage().get(0).getProd_img());
		json.put("prod_desc", p.getProd_desc());
		json.put("stock", p.getStock());
		return json.toString();
	}
	
	//fk(subcategory_id)로 해당 하위상품 모두 조회
	@RequestMapping(value="/product/prod/{subcategory_id}",method=RequestMethod.GET)
	@ResponseBody
	public String selectByFk(HttpServletRequest request, @PathVariable("subcategory_id") int subcategory_id) {
		System.out.println("sub_id로 하위상품 모두조회 컨트롤러 메서드 호출");
		List<Topcategory> topList = topcategoryService.selectAll();
		List<Subcategory> subList = new ArrayList<Subcategory>();
		for(Topcategory top:topList) {
			subList.addAll(subcategoryService.selectAllByFk(top.getTopcategory_id()));
		}
		
		List<Product> sortProdList = productService.selectAllByFk(subcategory_id);
		JSONArray prodSortArray = new JSONArray();
		for(Product p : sortProdList) {
			JSONObject json = new JSONObject();
			
			json.put("product_id", p.getProduct_id());

			for(Subcategory s:subList) {
				if(s.getSubcategory_id()==p.getSubcategory().getSubcategory_id()) {
					p.getSubcategory().setTopcategory(s.getTopcategory());
				}
			}
			
			json.put("topcategory_id", p.getSubcategory().getTopcategory().getTopcategory_id());
			json.put("topcate_name", p.getSubcategory().getTopcategory().getTopcate_name());
			json.put("subcate_name", p.getSubcategory().getSubcate_name());
			json.put("prod_name_kor", p.getProd_name_kor());
			json.put("prod_name_eng", p.getProd_name_eng());
			json.put("price", p.getPrice());
			json.put("prod_desc", p.getProd_desc());
			json.put("stock",p.getStock());
			if(p.getProductImage().size()>0) {
				json.put("prod_img", p.getProductImage().get(0).getProd_img());
			}else {
				json.put("prod_img", "no_img.jpg");
			}
			prodSortArray.add(json);
		}
		return prodSortArray.toString();
	}
	
	//이미지 목록 가져오기
	@RequestMapping(value="/product/img",method=RequestMethod.GET)
	@ResponseBody
	public String getImgList() {
		System.out.println("상품관리 페이지 로딩될 때와 이미지 수정 선택할 때 이미지 목록 얻기 요청");
		List<ProductImage> imgList = productService.getImg();
		return imgList.toString();		
	}
	
	//검색어로 상품조회
	@RequestMapping(value="/product/search/{searchWord}",method=RequestMethod.GET)
	@ResponseBody
	public String prodSearch(@PathVariable("searchWord") String searchWord) {
		List<Product> searchedList = productService.search(searchWord);
				
		List<Topcategory> topList = topcategoryService.selectAll();
		List<Subcategory> subList = new ArrayList<Subcategory>();
		for(Topcategory top:topList) {
			subList.addAll(subcategoryService.selectAllByFk(top.getTopcategory_id()));
		}
		
		JSONArray searchResultArray = new JSONArray();
		
		for(Product p:searchedList) {
			JSONObject json_p = new JSONObject();
							
			for(Subcategory s:subList) {
				if(s.getSubcategory_id()==p.getSubcategory().getSubcategory_id()) {
					p.getSubcategory().setTopcategory(s.getTopcategory());
				}
			}
			json_p.put("product_id", p.getProduct_id());
			
			json_p.put("topcategory_id", p.getSubcategory().getTopcategory().getTopcategory_id());
			json_p.put("topcate_name", p.getSubcategory().getTopcategory().getTopcate_name());
			json_p.put("subcate_name", p.getSubcategory().getSubcate_name());
			json_p.put("prod_name_kor",p.getProd_name_kor());
			json_p.put("prod_name_eng",p.getProd_name_eng());
			json_p.put("price", p.getPrice());
			json_p.put("prod_desc", p.getProd_desc());
			json_p.put("stock", p.getStock());
			if(p.getProductImage().size()>0) {				
				json_p.put("prod_img",p.getProductImage().get(0).getProd_img());//대표 이미지 하나만 뽑아오도록
			}else {
				json_p.put("prod_img","no_img.jpg");
			}
			searchResultArray.add(json_p);
		}
					
		return searchResultArray.toString();
	}
	
	
	//상품등록
	@RequestMapping(value="/product",method=RequestMethod.POST)
	@ResponseBody
	public String regist(Product product,Integer subcategory_id,ProductImage productImage,HttpServletRequest request) {//subcategory_id를 parameter로 받아서 setSubcategory_id해줘야 하나 검증 필요
		//System.out.println("프로덕 컨에서 확인, 넘겨받은 sub_id : "+product.getSubcategory().getSubcategory_id());
		Subcategory subcategory = new Subcategory();
		subcategory.setSubcategory_id(subcategory_id);
		product.setSubcategory(subcategory);
		System.out.println("넘겨받아 주입한 sub_id확인 : "+product.getSubcategory().getSubcategory_id());
		String path = request.getServletContext().getRealPath("/data");
		
		productService.insert(product,productImage,path);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//선택상품 삭제
	@RequestMapping(value="/product/del",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@RequestParam(value="checkArray[]") List<Integer> deleteList,HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/data");
		List<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++) {
			deleteArray.add(deleteList.get(i));
		}
		productService.delete(deleteArray, path);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//상품정보 수정
	@RequestMapping(value="/product/update",method=RequestMethod.POST)
	@ResponseBody
	public String updateProd(Product product,Integer subcategory_id,ProductImage productImage, HttpServletRequest request) {
		System.out.println("admin product컨트롤러 상품정보수정 요청");
		System.out.println("상품정보 수정하라고 전달받은 기존이미지 확인 : "+productImage.getDeleteFile());
		System.out.println("상품정보 수정하라고 전달받은 새 이미지 확인 : "+productImage.getMyFile());
		//System.out.println("controller가 수정하라고 받은 product : "+product);
		//System.out.println("controller가 수정하라고 받은 flag : "+isImgChanged);
		
		Subcategory subcategory = subcategoryService.select(subcategory_id);
		//subcategory.setSubcategory_id(subcategory_id);
		product.setSubcategory(subcategory);		
		String path = request.getServletContext().getRealPath("/data");

		productService.update(product,productImage,path);
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
