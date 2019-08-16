package com.jimmyzip.momos.model.service.member;

import java.util.List;
import com.jimmyzip.momos.model.domain.member.Auth;

public interface AuthService {
	public List<Auth> selectAll();
	public Auth select(int auth_id);
	public void insert(Auth auth);
	public void update(Auth auth);
	public void delete(int auth_id);
}
