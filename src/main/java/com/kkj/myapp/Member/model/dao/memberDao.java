package com.kkj.myapp.Member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kkj.myapp.Member.model.vo.Member;

@Repository
public class memberDao {

	public String createMemberCheck(Member m, SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("memberMapper.overlap", m);

	}

	public String createMemberCheck2(Member m, SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("memberMapper.overlaptwo", m);

	}

	public int createMember(Member m, SqlSessionTemplate sqlsession) {
		return sqlsession.insert("memberMapper.createMember",m);
	}

	public void signUpConfirm(Member m, SqlSessionTemplate sqlsession) {
				sqlsession.update("memberMapper.signUpConfirm",m);
	}

	public Member loginMember(Member m, SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("memberMapper.loginMember",m);
	}

	public void reMember(Member m, SqlSessionTemplate sqlsession) {
		sqlsession.update("memberMapper.reMember",m);
		
	}

}
