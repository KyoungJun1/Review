package com.kkj.myapp.Member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kkj.myapp.Member.model.vo.Member;

public interface memberService {

	String[] createMemberCheck(Member m);

	int createMember(Member m);

	String sendAuthMail(String email);

	void signUpConfirm(Member m);

	Member loginMember(Member m);

	void myPage(Member m);

	void reMember(Member m);

}
