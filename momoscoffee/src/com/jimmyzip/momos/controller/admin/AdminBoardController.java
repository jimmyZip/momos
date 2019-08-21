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
import com.jimmyzip.momos.model.domain.board.Freeboard;
import com.jimmyzip.momos.model.service.board.BoardService;

@Controller
@RequestMapping("/admin")
public class AdminBoardController {
	@Autowired
	BoardService boardService;
	Pager pager = new Pager();
	
	//게시판관리 페이지로 이동
	@RequestMapping(value="/board/page",method=RequestMethod.GET)
	public ModelAndView ShowBoardPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_board");
		return mav;
	}
	
	//게시글 1건 상세보기 페이지 이동 요청
	@RequestMapping(value="/board/page/{board_id}",method=RequestMethod.GET)
	public ModelAndView ShowBoardDetailPage(@PathVariable("board_id") int board_id,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_board_detail");
		Freeboard b = boardService.select(board_id);
		mav.addObject("board_info",b);
		return mav;
	}
	
	//pk로 1건조회
	@RequestMapping(value="/board/{board_id}",method=RequestMethod.GET)
	@ResponseBody
	public String select(int board_id) {
		Freeboard b = boardService.select(board_id);
		JSONObject json = new JSONObject();
		json.put("board_id", b.getBoard_id());
		json.put("member_id", b.getMembers().getMember_id());
		json.put("userid",b.getMembers().getUserid());
		json.put("title", b.getTitle());
		json.put("content", b.getContent());
		json.put("wdate", b.getWdate());
		json.put("modidate", b.getModidate());
		json.put("ip",b.getIp());
		json.put("hit", b.getHit());
		return json.toString();
	}
	
	//fk로 조회
	@RequestMapping(value="/board/b/{member_id}",method=RequestMethod.GET)
	@ResponseBody
	public String selectByFk(HttpServletRequest request,@PathVariable("member_id") int member_id) {
		List<Freeboard> boardList = boardService.selectAllByFk(member_id);
		JSONArray totalArray = new JSONArray();
		for(Freeboard b:boardList) {
			JSONObject json = new JSONObject();
			json.put("board_id", b.getBoard_id());
			json.put("member_id", b.getMembers().getMember_id());
			json.put("userid",b.getMembers().getUserid());
			json.put("title", b.getTitle());
			json.put("content", b.getContent());
			json.put("wdate", b.getWdate());
			json.put("modidate", b.getModidate());
			json.put("ip",b.getIp());
			json.put("hit", b.getHit());
			totalArray.add(json);
		}
		return totalArray.toString();
	}
	
	//ip로 조회
	@RequestMapping(value="/board/ip/{ip}",method=RequestMethod.GET)
	@ResponseBody
	public String selectByIp(HttpServletRequest request,@PathVariable("ip") String ip) {
		List<Freeboard> boardList = boardService.selectAllByIp(ip);
		JSONArray totalArray = new JSONArray();
		for(Freeboard b:boardList) {
			JSONObject json = new JSONObject();
			json.put("board_id", b.getBoard_id());
			json.put("member_id", b.getMembers().getMember_id());
			json.put("userid",b.getMembers().getUserid());
			json.put("title", b.getTitle());
			json.put("content", b.getContent());
			json.put("wdate", b.getWdate());
			json.put("modidate", b.getModidate());
			json.put("ip",b.getIp());
			json.put("hit", b.getHit());
			totalArray.add(json);
		}
		return totalArray.toString();
	}
	
	//전체목록요청
	@RequestMapping(value="/board",method=RequestMethod.GET)
	@ResponseBody
	public String showAllBoard(HttpServletRequest request) {
		List<Freeboard> boardList = boardService.selectAll();
		JSONArray totalArray = new JSONArray();
		for(Freeboard b:boardList) {
			JSONObject json = new JSONObject();
			json.put("board_id", b.getBoard_id());
			json.put("member_id", b.getMembers().getMember_id());
			json.put("userid",b.getMembers().getUserid());
			json.put("title", b.getTitle());
			json.put("content", b.getContent());
			json.put("wdate", b.getWdate());
			json.put("modidate", b.getModidate());
			json.put("ip",b.getIp());
			json.put("hit", b.getHit());
			totalArray.add(json);
		}
		return totalArray.toString();
	}
	
	//글삭제요청
	@RequestMapping(value="/board",method=RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestParam(value="checkArray[]") List<Integer> deleteList,HttpServletRequest request) {
		List<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++) {
			deleteArray.add(deleteList.get(i));
		}
		boardService.delete(deleteArray);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
	
	//동기삭제
	@RequestMapping(value="/admin/board/del/{board_id}")
	public ModelAndView deleteSync(@PathVariable("board_id") int board_id) {
		ModelAndView mav = new ModelAndView("admin/admin_board");
		return mav;
	}
	
	//검색요청
	@RequestMapping(value="/board/search/{searchWord}",method=RequestMethod.GET)
	@ResponseBody
	public String boardSearch(@PathVariable("searchWrod") String searchWord) {
		List<Freeboard> searchedList = boardService.search(searchWord);
		JSONArray searchResultArray = new JSONArray();
		for(Freeboard b:searchedList) {
			JSONObject json = new JSONObject();
			json.put("board_id", b.getBoard_id());
			json.put("member_id", b.getMembers().getMember_id());
			json.put("userid",b.getMembers().getUserid());
			json.put("title", b.getTitle());
			json.put("content", b.getContent());
			json.put("wdate", b.getWdate());
			json.put("modidate", b.getModidate());
			json.put("ip",b.getIp());
			json.put("hit", b.getHit());
			searchResultArray.add(json);
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
