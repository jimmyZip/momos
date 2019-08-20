package com.jimmyzip.momos.model.repository.board;

import java.util.List;

import com.jimmyzip.momos.model.domain.board.Freeboard;

public interface BoardDAO {
	public Freeboard select(int board_id);
	public List<Freeboard> selectAll();
	public List<Freeboard> selectAllByIp(String ip);
	public List<Freeboard> selectAllByFk(int member_id);
	public int insert(Freeboard freeboard);
	public int update(Freeboard freeboard);
	public int delete(int board_id);
	public List<Freeboard> search(String searchWord);
	public int hitUp(int board_id);
}
