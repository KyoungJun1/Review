package com.kkj.myapp.Member.model.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.kkj.myapp.Member.model.dao.memberDao;
import com.kkj.myapp.Member.model.vo.MailUtils;
import com.kkj.myapp.Member.model.vo.Member;

@Service
public class memberServicempl implements memberService {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Autowired
	private memberDao md;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Override
	public String[] createMemberCheck(Member m) {

		String idCheck = md.createMemberCheck(m, sqlsession);

		String emailCheck = md.createMemberCheck2(m, sqlsession);

		String[] check = new String[2];
		check[0] = idCheck;
		check[1] = emailCheck;

		return check;

	}

	@Override
	public int createMember(Member m) {

		int check = md.createMember(m, sqlsession);

		return check;
	}

	@Override
	public String sendAuthMail(String email) {

		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>").append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:8094/myapp/signUpConfirm?email=").append(email)
					.append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("rhdkfk6027@gmail.com", "관리자");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return "";
	}

	@Override
	public void signUpConfirm(Member m) {

		md.signUpConfirm(m, sqlsession);
	}

	@Override
	public Member loginMember(Member m) {

		Member login = md.loginMember(m, sqlsession);

		return login;
	}

	@Override
	public void myPage(Member m) {

	}

	@Override
	public void reMember(Member m) {

		md.reMember(m, sqlsession);

	}

}
