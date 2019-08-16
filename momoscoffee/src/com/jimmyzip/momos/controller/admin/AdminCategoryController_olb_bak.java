/*
 * // //package com.jimmyzip.momos.controller.admin;
 * 
 * //import java.util.ArrayList; //import java.util.List;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.apache.log4j.Logger; import org.json.simple.JSONArray; import
 * org.json.simple.JSONObject; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.servlet.ModelAndView;
 * 
 * import com.jimmyzip.momos.common.Pager; import
 * com.jimmyzip.momos.model.domain.product.Subcategory; import
 * com.jimmyzip.momos.model.domain.product.Topcategory; import
 * com.jimmyzip.momos.model.service.product.ProductService; import
 * com.jimmyzip.momos.model.service.product.SubcategoryService; import
 * com.jimmyzip.momos.model.service.product.TopcategoryService;
 * 
 * //@Controller //@RequestMapping("/admin") public class
 * AdminCategoryController_olb_bak {
 * 
 * @Autowired TopcategoryService topcategoryService;
 * 
 * @Autowired SubcategoryService subcategoryService;
 * 
 * @Autowired ProductService productService;
 * 
 * Logger logger = Logger.getLogger(this.getClass().getName()); Pager pager =
 * new Pager();
 * 
 * //관리 페이지로 이동
 * 
 * @RequestMapping(value="/category/page",method=RequestMethod.GET) public
 * ModelAndView showCategory(HttpServletRequest request) {
 * logger.trace("카테고리 관리 페이지로 이동"); ModelAndView mav = new
 * ModelAndView("admin/admin_category"); List<Topcategory> topCateList =
 * topcategoryService.selectAll(); List<Subcategory> subCateList = null;
 * if(topCateList!=null) { for(int i=0;i<topCateList.size();i++) {
 * subCateList.add((Subcategory)
 * subcategoryService.selectAllByFk(topCateList.get(i).getTopcategory_id())); }
 * } pager.init(request, topCateList.size()); mav.addObject("topCateList",
 * topCateList); mav.addObject("subCateList", subCateList);
 * mav.addObject("pager", pager); return mav; }
 * 
 * //관리 페이지 이동
 * 
 * @RequestMapping(value="/category/page",method=RequestMethod.GET) public
 * ModelAndView showCategory(HttpServletRequest request) {
 * logger.trace("카테고리 관리 페이지로 이동"); ModelAndView mav = new
 * ModelAndView("admin/admin_category"); return mav; }
 * 
 * //전체목록 요청
 * 
 * @RequestMapping(value="/category",method=RequestMethod.GET)
 * 
 * @ResponseBody public String selectAll(HttpServletRequest request) {
 * System.out.println("카테고리 전체목록 요청"); List<Topcategory> topCateList =
 * topcategoryService.selectAll();
 * System.out.println("topCateList.size확인 : "+topCateList.size());
 * List<Subcategory> subCateList = null; if(topCateList!=null) {
 * request.getSession().setAttribute("topCateList", topCateList); for(int
 * i=0;i<topCateList.size();i++) { //subCateList.add((Subcategory)
 * subcategoryService.selectAllByFk(topCateList.get(i).getTopcategory_id()));
 * if(subcategoryService.selectAllByFk(topCateList.get(i).getTopcategory_id())!=
 * null) {
 * subCateList.addAll(subcategoryService.selectAllByFk(topCateList.get(i).
 * getTopcategory_id())); }; } request.getSession().setAttribute("subCateList",
 * subCateList); } JSONArray jsonArray = new JSONArray(); for(int
 * i=0;i<topCateList.size();i++) { Topcategory top = topCateList.get(i);
 * JSONObject json = new JSONObject(); json.put("topcategory_id",
 * top.getTopcategory_id()); json.put("topcate_name",top.getTopcate_name());
 * for(int j=0;j<subCateList.size();j++) { Subcategory sub = subCateList.get(j);
 * json.put("subcategory_id", sub.getSubcategory_id());
 * json.put("sub_topcategory_id", sub.getTopcategory().getTopcategory_id());
 * json.put("subcate_name", sub.getSubcate_name()); } } return
 * jsonArray.toString(); }
 * 
 * //상위카테고리 등록
 * 
 * @RequestMapping(value="/category/top",method=RequestMethod.POST)
 * 
 * @ResponseBody public String topcateInsert(HttpServletRequest request,
 * Topcategory topcategory) { logger.trace("상위카테고리 등록 요청"); //등록 전 이름 겹치는지 확인
 * Topcategory top =
 * topcategoryService.cateNameCheck(topcategory.getTopcate_name()); StringBuffer
 * sb = new StringBuffer(); if(top==null) {
 * topcategoryService.insert(topcategory); sb.append("{");
 * sb.append("\"result\":1"); sb.append("}"); }else { sb.append("{");
 * sb.append("\"result\":0"); sb.append("}"); }
 * 
 * return sb.toString(); }
 * 
 * //하위카테고리 등록
 * 
 * @RequestMapping(value="/category/sub",method=RequestMethod.POST)
 * 
 * @ResponseBody public String subcateInsert(HttpServletRequest request,
 * Subcategory subcategory) { logger.trace("하위카테고리 등록 요청"); //등록 전 이름 겹치는지 확인
 * Subcategory sub =
 * subcategoryService.cateNameCheck(subcategory.getSubcate_name()); StringBuffer
 * sb = new StringBuffer(); if(sub==null) {
 * subcategoryService.insert(subcategory); sb.append("{");
 * sb.append("\"result\":1"); sb.append("}"); }else { sb.append("{");
 * sb.append("\"result\":0"); sb.append("}"); } return sb.toString(); }
 * 
 * //상위카테고리 삭제
 * 
 * @RequestMapping(value="/category/{topcategory_id}",method=RequestMethod.
 * DELETE)
 * 
 * @ResponseBody public String topcateDelete(@PathVariable("topcategory_id") int
 * topcategory_id) { topcategoryService.delete(topcategory_id); StringBuffer sb
 * = new StringBuffer(); sb.append("{"); sb.append("\"result\":1");
 * sb.append("}"); return sb.toString(); }
 * 
 * //하위카테고리 삭제
 * 
 * @RequestMapping(value="/category/{subcategory_id}",method=RequestMethod.
 * DELETE)
 * 
 * @ResponseBody public String subcateDelete(@PathVariable("subcategory_id") int
 * subcategory_id) { subcategoryService.delete(subcategory_id); StringBuffer sb
 * = new StringBuffer(); sb.append("{"); sb.append("\"result\":1");
 * sb.append("}"); return sb.toString(); }
 * 
 * //상위카테고리 수정
 * 
 * @RequestMapping(value="/category/top",method=RequestMethod.PUT)
 * 
 * @ResponseBody public String topcateEdit(Topcategory topcategory) {
 * topcategoryService.update(topcategory); StringBuffer sb = new StringBuffer();
 * sb.append("{"); sb.append("\"result\":1"); sb.append("}"); return
 * sb.toString(); }
 * 
 * //하위카테고리 수정
 * 
 * @RequestMapping(value="/category/sub",method=RequestMethod.PUT)
 * 
 * @ResponseBody public String subcateEdit(Subcategory subcategory) {
 * subcategoryService.update(subcategory); StringBuffer sb = new StringBuffer();
 * sb.append("{"); sb.append("\"result\":1"); sb.append("}"); return
 * sb.toString(); } }
 */