package com.jimmyzip.momos.model.repository.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jimmyzip.momos.model.domain.board.Freeboard;

@Repository
public class MybatisBoardDAO implements BoardDAO{

	@Autowired
	SqlSessionTemplate sessionTemplate;

	//지정 pk값으로 1건조회
	public Freeboard select(int board_id) {
		return sessionTemplate.selectOne("Freeboard.select", board_id);
	}
	//전체글조회
	public List<Freeboard> selectAll() {
		return sessionTemplate.selectList("Freeboard.selectAll");
	}
	//ip로 글 조회
	public List<Freeboard> selectAllByIp(String ip) {
		return sessionTemplate.selectList("Freeboard.selectAllByIp", ip);
	}
	//Fk(member_id)로 조회
	public List<Freeboard> selectAllByFk(int member_id) {
		return sessionTemplate.selectList("Freeboard.selectAllByFk", member_id);
	}
	//글등록
	public int insert(Freeboard freeboard) {
		return sessionTemplate.insert("Freeboard.insert", freeboard);
	}
	//글수정
	public int update(Freeboard freeboard) {
		return sessionTemplate.update("Freeboard.update", freeboard);
	}
	//글삭제
	public int delete(int board_id) {
		return sessionTemplate.delete("Freeboard.delete", board_id);
	}
	//글 검색
	public List<Freeboard> search(String searchWord) {
		return sessionTemplate.selectList("Freeboard.search", searchWord);
	}
	//조회수
	public int hitUp(int board_id) {
		return sessionTemplate.update("Freeboard.hitUp", board_id);
	}
	

}
