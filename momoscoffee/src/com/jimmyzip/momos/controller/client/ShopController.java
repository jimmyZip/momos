package com.jimmyzip.momos.controller.client;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.common.Pager;
import com.jimmyzip.momos.model.domain.product.Product;
import com.jimmyzip.momos.model.domain.product.Subcategory;
import com.jimmyzip.momos.model.domain.product.Topcategory;
import com.jimmyzip.momos.model.service.product.ProductService;
import com.jimmyzip.momos.model.service.product.SubcategoryService;
import com.jimmyzip.momos.model.service.product.TopcategoryService;

@Controller
@RequestMapping("/client")
public class ShopController {
	@Autowired
	TopcategoryService topcateService;
	@Autowired
	SubcategoryService subcateService;
	@Autowired
	ProductService productService;
	
	Pager pager = new Pager();
	
	//커피 등 굿즈 페이지
	@RequestMapping(value="/goGoods/page",method=RequestMethod.GET)
	public ModelAndView goShopPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/pages/shop");
		List<Topcategory> topcateList = topcateService.selectAll();
		List<Subcategory> subcateList = subcateService.selectAll();
		List<Product> prodList = productService.selectAll();
		pager.init(request, prodList.size());
		mav.addObject("topcateList", topcateList);
		mav.addObject("subcateList", subcateList);
		mav.addObject("prodList", prodList);
		mav.addObject("pager", pager);
		return mav;
	}
	
	//커피 등 굿즈 페이지 분류보기
	@RequestMapping(value="/goGoods/page/sort/{topcategory_id}",method=RequestMethod.GET)
	public ModelAndView categoryView(HttpServletRequest request,@PathVariable("topcategory_id") int topcategory_id) {
		List<Topcategory> topcateList = topcateService.selectAll();
		List<Subcategory> subcateList = subcateService.selectAllByFk(topcategory_id);
		List<Product> prodList = new ArrayList<Product>();
		for(Subcategory sub:subcateList) {
			prodList.addAll(productService.selectAllByFk(sub.getSubcategory_id()));
		}
		pager.init(request, prodList.size());
		ModelAndView mav = new ModelAndView("client/pages/shop");
		mav.addObject("topcateList", topcateList);
		mav.addObject("subcateList", subcateList);
		mav.addObject("prodList", prodList);
		mav.addObject("pager", pager);
		return mav;
	}
	
	//제품 상세페이지로 이동
	@RequestMapping(value="/goGoodsDetail/{product_id}",method=RequestMethod.GET)
	public ModelAndView goGoodsDetailPage(@PathVariable("product_id") int product_id) {
		Product p = productService.select(product_id);
		Subcategory sub = subcateService.select(p.getSubcategory().getSubcategory_id());
		if(sub.getSubcategory_id()==p.getSubcategory().getSubcategory_id()) {
			p.getSubcategory().setTopcategory(sub.getTopcategory());
		}
		ModelAndView mav = new ModelAndView("client/pages/shop_detail");
		List<Subcategory> subcateList = subcateService.selectAll();
		mav.addObject("product", p);
		
		return mav;
	}
	
	//생두 페이지
	@RequestMapping(value="/goGreenbean",method=RequestMethod.GET)
	public ModelAndView goGreenPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("client/pages/greenbean");
		List<Topcategory> topcateList = topcateService.selectAll();
		List<Subcategory> subcateList = subcateService.selectAll();
		List<Product> prodList = productService.selectAll();
		pager.init(request, prodList.size());
		mav.addObject("topcateList", topcateList);
		mav.addObject("subcateList", subcateList);
		mav.addObject("prodList", prodList);
		mav.addObject("pager", pager);
		return mav;
	}
}
