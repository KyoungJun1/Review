package com.kkj.myapp.Member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kkj.myapp.Member.model.service.memberService;
import com.kkj.myapp.Member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private memberService ms;

	// 로그인 페이지 이동
	@RequestMapping("loginPage")
	public String loginPage() {

		return "login";
	}


	@RequestMapping("master")
	public String masterPage() {

		return "master";
	}

	// 마이페이지 이동
	@RequestMapping("myPage")
	public String myPage(HttpSession session, Model model) {

		Member m = (Member) session.getAttribute("member");

		model.addAttribute("m", m);

		return "myPage";
	}

	// 마이페이지 계정 수정
	@RequestMapping("reMember")
	public String reMember(String id, String pw, int phone, String address1, String address2, Model model,
			HttpSession session) {

		Member m = new Member();

		m.setId(id);
		m.setPw(pw);
		m.setPhone(phone);
		m.setAddress(address1 + " " + address2);

		ms.reMember(m);

		Member newlogin = ms.loginMember(m);

		session.setAttribute("member", newlogin);
		model.addAttribute("m", newlogin);

		return "myPage";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "login";
	}

	// 회원가입 페이지 이동
	@RequestMapping("createMemberPage")
	public String createMemberPage() {

		return "signUp";
	}

	// 로그인 정보 전달
	@RequestMapping(value = "loginMember", produces = "text/plain;charset=UTF-8")
	public String loginMember(String id, String pw, HttpSession session, Model model) {

		Member m = new Member();

		m.setId(id);
		m.setPw(pw);

		Member login = ms.loginMember(m);

		if (login == null) {
			return "login";
		} else {
			session.setAttribute("member", login);
			model.addAttribute("name", login.getName());
			return "index";
		}

	}

	// 회원가입 정보 전달
	@RequestMapping(value = "createMember", produces = "text/plain;charset=UTF-8")
	public String createMember(String id, String pw, String name, String email, int phone, String address,
			String address2) {

		Member m = new Member();

		m.setId(id);
		m.setPw(pw);
		m.setName(name);
		m.setEmail(email);
		m.setPhone(phone);
		m.setAddress(address + " " + address2);

		// DB 정보 삽입
		int check = ms.createMember(m);

		// 임의의 authKey 생성 & 이메일 발송
		String authKey = ms.sendAuthMail(email);

		return "login";
	}

	// 회원가입 아이디 이메일 체크
	@RequestMapping("createMemberCheck")
	@ResponseBody
	public String[] createMemberCheck(@RequestParam("id") String id, @RequestParam("email") String email) {

		Member m = new Member();

		m.setId(id);
		m.setEmail(email);

		String[] check = ms.createMemberCheck(m);

		return check;

	}

	@RequestMapping("signUpConfirm")
	public String signUpConfirm(@RequestParam("email") String email) {

		Member m = new Member();

		m.setEmail(email);

		ms.signUpConfirm(m);

		return "mailcheck";
	}
	
	@RequestMapping("main")
	public String signUpConfirm( HttpSession session, Model model) {
		
		Member m = (Member) session.getAttribute("member");
		
		if(m != null) {
			model.addAttribute("name",m.getName());

		}else {
			
		}
		
		

		return "index";
	}
	
	

}
