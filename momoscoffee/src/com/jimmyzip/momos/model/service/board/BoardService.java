package com.jimmyzip.momos.model.service.board;

import java.util.List;

import com.jimmyzip.momos.model.domain.board.Freeboard;

public interface BoardService {
	public Freeboard select(int board_id);
	public List<Freeboard> selectAll();
	public List<Freeboard> selectAllByIp(String ip);
	public List<Freeboard> selectAllByFk(int member_id);
	public void insert(Freeboard freeboard);
	public void update(Freeboard freeboard);
	public void delete(List<Integer> deleteArray);
	public List<Freeboard> search(String searchWord);
	public void hitUp(int board_id);
}
