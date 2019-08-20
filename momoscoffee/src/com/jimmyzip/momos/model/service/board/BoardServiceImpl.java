package com.jimmyzip.momos.model.service.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.exception.RegistFailException;
import com.jimmyzip.momos.model.domain.board.Freeboard;
import com.jimmyzip.momos.model.domain.member.Members;
import com.jimmyzip.momos.model.repository.board.BoardDAO;
import com.jimmyzip.momos.model.repository.member.MemberDAO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{
	@Autowired
	@Qualifier("mybatisBoardDAO")
	private BoardDAO boardDAO;
	
	@Autowired
	@Qualifier("mybatisMemberDAO")
	private MemberDAO memberDAO;
	
	//pk로 1건조회
	public Freeboard select(int board_id) {
		Freeboard board = boardDAO.select(board_id);
		int member_id = board.getMembers().getMember_id();//여기서 nullpointerException발생할 경우 freeboard DTO에 member_id 필드 추가
		Members members = memberDAO.select(member_id);
		board.setMembers(members);
		return board;
	}
	//전체글 조회
	public List<Freeboard> selectAll() {
		List<Freeboard> boardList = boardDAO.selectAll();
		//List<Members> memberList = new ArrayList<Members>();
		for(Freeboard b:boardList) {
			int member_id = b.getMembers().getMember_id();
			Members members = memberDAO.select(member_id);
			b.setMembers(members);
		}
		return boardList;
	}
	//같은 ip에서 적은 글 조회
	public List<Freeboard> selectAllByIp(String ip) {
		List<Freeboard> boardList = boardDAO.selectAllByIp(ip);
		for(Freeboard b:boardList) {
			int member_id = b.getMembers().getMember_id();
			Members members = memberDAO.select(member_id);
			b.setMembers(members);
		}
		return boardList;
	}
	//글쓴이로 조회
	public List<Freeboard> selectAllByFk(int member_id) {
		List<Freeboard> boardList = boardDAO.selectAllByFk(member_id);
		for(Freeboard b:boardList) {
			Members members = memberDAO.select(member_id);
			b.setMembers(members);
		}
		return boardList;
	}
	//글 등록
	public void insert(Freeboard freeboard) throws RegistFailException{
		int result = boardDAO.insert(freeboard);
		if(result==0) {
			throw new RegistFailException("글 등록에 실패했습니다.");
		}
	}
	//글 수정
	public void update(Freeboard freeboard) throws EditFailException{
		int result = boardDAO.update(freeboard);
		if(result==0) {
			throw new EditFailException("글 수정에 실패했습니다.");
		}
	}
	//글삭제
	public void delete(List<Integer> deleteArray) throws DeleteFailException{
		int result=0;//삭제여부
		for(int i=0;i<deleteArray.size();i++) {
			int board_id = deleteArray.get(i);
			result=boardDAO.delete(board_id);
		}
		if(result==0) {
			throw new DeleteFailException("글 삭제에 실패했습니다.");
		}
	}
	//글 검색
	public List<Freeboard> search(String searchWord) {
		return boardDAO.search(searchWord);
	}
	//조회수증가
	public void hitUp(int board_id) throws EditFailException{
		int result = boardDAO.hitUp(board_id);
		if(result==0) {
			throw new EditFailException("글 조회수 증가오류");
		}		
	}
}
