package com.jimmyzip.momos.model.repository.member;

import java.util.List;
import com.jimmyzip.momos.model.domain.member.Auth;

public interface AuthDAO {
	public List<Auth> selectAll();
	public Auth select(int auth_id);
	public int insert(Auth auth);
	public int update(Auth auth);
	public int delete(int auth_id);
}
