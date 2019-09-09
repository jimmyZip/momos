package com.jimmyzip.momos.common.member;

import org.springframework.stereotype.Component;

import com.jimmyzip.momos.model.domain.member.Auth;

@Component
public class Admin {
	public boolean adminCheck(Auth auth) {
		return auth.isAdmin_assign() || auth.isMember_del() || auth.isBoard_del() || auth.isProduct_del() || auth.isBranch_del() || auth.isCategory_del();
	}
}
