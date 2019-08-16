package com.jimmyzip.momos.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.jimmyzip.momos.model.domain.member.Auth;
@Repository
@Transactional
public class MybatisAuthDAO implements AuthDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<Auth> selectAll() {
		return sessionTemplate.selectList("Auth.selectAll");
	}

	@Override
	public Auth select(int auth_id) {
		return sessionTemplate.selectOne("Auth.select", auth_id);
	}

	@Override
	public int insert(Auth auth) {
		return sessionTemplate.insert("Auth.insert",auth);
	}

	@Override
	public int update(Auth auth) {
		return sessionTemplate.insert("Auth.insert", auth);
	}

	@Override
	public int delete(int auth_id) {
		return sessionTemplate.delete("Auth.delete", auth_id);
	}
}
