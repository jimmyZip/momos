package com.jimmyzip.momos.controller.client;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.jimmyzip.momos.common.Pager;
import com.jimmyzip.momos.model.domain.board.Freeboard;
import com.jimmyzip.momos.model.domain.member.Members;
import com.jimmyzip.momos.model.service.board.BoardService;

@Controller
@RequestMapping("/client")
public class FBoardController {
	@Autowired
	BoardService boardService;
	
	Pager pager = new Pager();
	
	//자유게시판(목록) 페이지로 이동
	@RequestMapping(value="/goBoard/page",method=RequestMethod.GET)
	public ModelAndView goBoardPage(HttpServletRequest request) {
		System.out.println("게시물 목록 페이지로 이동요청하며 목록을 가져갑니다.");
		ModelAndView mav = new ModelAndView("client/board/board_list");
		List<Freeboard> boardList = boardService.selectAll();
		pager.init(request, boardList.size());
		mav.addObject("boardList", boardList);
		mav.addObject("pager",pager);
		return mav;
	}
	
	//게시물 등록 페이지 이동
	
	@RequestMapping(value="/board/goRegist",method=RequestMethod.GET)
	public ModelAndView goRegistPage() {
		ModelAndView mav = new ModelAndView("client/board/board_write");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String clientIp = req.getHeader("X-FORWARDED-FOR");
		if(clientIp==null) {
			//clientIp = req.getRemoteAddr();//loopback의 ipv6버전으로 얻어짐
			 try {
				//ipv4얻기
				clientIp = Inet4Address.getLocalHost().getHostAddress();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		}
		mav.addObject("clientIp", clientIp);
		return mav;
	}
	
	
	//게시물 등록요청
	@RequestMapping(value="/board",method=RequestMethod.POST)
	public ModelAndView boardRegist(Freeboard freeboard,int member_id) {
		System.out.println("게시글 등록요청 받음");
		Members members = new Members();
		members.setMember_id(member_id);
		freeboard.setMembers(members);
		boardService.insert(freeboard);
		ModelAndView mav = new ModelAndView("redirect:/client/goBoard/page");
		return mav;
	}
	
	//게시물 상세보기 요청
	@RequestMapping(value="/board/{board_id}",method=RequestMethod.GET)
	public ModelAndView showDetail(@PathVariable("board_id") int board_id) {
		boardService.hitUp(board_id);
		Freeboard board = boardService.select(board_id);
		ModelAndView mav = new ModelAndView("client/board/board_detail");
		mav.addObject("board", board);
		return mav;
	}
	//게시물 본인확인용 요청
	@RequestMapping(value="/board/identi/{board_id}",method=RequestMethod.GET)
	@ResponseBody
	public String boardIdentification(@PathVariable("board_id") int board_id) {
		Freeboard board = boardService.select(board_id);
		JSONObject obj = new JSONObject();
		obj.put("userid", board.getMembers().getUserid());
		return obj.toString();
	}
	
	//게시물 수정요청
	@RequestMapping(value="/board/update",method=RequestMethod.POST)
	public ModelAndView updateBoard(Freeboard freeboard,int member_id) {
		Members members = new Members();
		members.setMember_id(member_id);
		freeboard.setMembers(members);
		boardService.update(freeboard);
		ModelAndView mav = new ModelAndView("redirect:/client/goBoard/page");
		return mav;
	}
	
	//게시물 삭제요청
	@RequestMapping(value="/board/del",method=RequestMethod.POST)
	public ModelAndView deleteBoard(int board_id) {
		boardService.delete(board_id);
		ModelAndView mav=new ModelAndView("redirect:/client/goBoard/page");
	    return mav;
	}
}
