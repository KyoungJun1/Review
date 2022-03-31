package com.kkj.myapp.Board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kkj.myapp.Board.model.service.boardService;
import com.kkj.myapp.Board.model.vo.Board;
import com.kkj.myapp.Board.model.vo.PagingVO;
import com.kkj.myapp.Member.model.vo.Member;

@Controller
public class boardController {

	@Autowired
	private boardService bs;

	// 도서 메인 페이지 리스트 조회
	@RequestMapping("boardPage")
	public String boardPage(HttpSession session, Model model, int num, @RequestParam(required = false) String check) {
		
		if(check == null) {
		
			//
			
		}else {
			model.addAttribute("check", check);
		}
		
		System.out.println("asdasdkewfjkfsd : " + num);
		
		int totalNum = bs.pageNum();

		// 10개씩 페이징
		int pageCount = 10;

		// 페이징 표시용
		int[] pageBtnEnd = new int[2];

		// 마지막 페이징 계산용
		int totalEnd = ((totalNum / pageCount) * pageCount) + 1;

		// 페이징 계산용
		// 마지막 페이징
		if (num == totalEnd) {

			pageBtnEnd[0] = totalEnd;

			pageBtnEnd[1] = totalNum;

			// 기본 페이징
		} else {
			System.out.println("lies");
			pageBtnEnd[1] = (int) (Math.ceil((num +10) / 10) * 10);

			pageBtnEnd[0] = pageBtnEnd[1] - 9;

		}
		System.out.println(pageBtnEnd[0] );

		System.out.println(pageBtnEnd[1] );

		// 게시글 조회 시작 번호
		int startNum = ((num - 1) / pageCount) * pageCount + 1;

		// 게시글 조회 마지막 번호
		int EndNum = startNum + pageCount - 1;

		PagingVO pv = new PagingVO();
		pv.setStart(startNum);
		pv.setEnd(EndNum);
		
	

		ArrayList<Board> b = bs.boardList(pv);

		System.out.println(startNum + "fuck");
		System.out.println(EndNum + "fuck");
		
		System.out.println(b + "fuck");

		model.addAttribute("boardList", b);

		model.addAttribute("page", pageBtnEnd);

		model.addAttribute("num", num);

		return "board";
	}

	// 게시판 추가 페이지 이동
	@RequestMapping("boardAddPage")
	public String boardAddPage(HttpSession session, Model model, int num , RedirectAttributes re) {
		Member m = (Member) session.getAttribute("member");
		if(m ==null) {
			re.addAttribute("check","no");
			re.addAttribute("num",num);
			System.out.println("king");
			return "redirect:boardPage";
		}else {
			return "boardAdd";

		}
		
	}

	// 게시판 삭제
	@RequestMapping("boardDel")
	public String boardDel(HttpSession session, Model model, int num) {
		System.out.println(num);

		bs.boardDel(num);

		return "redirect:boardPage";
	}

	// 게시판 추가
	@RequestMapping("boardAdd")
	public String boardAdd(HttpSession session, Model model, String title, String content,RedirectAttributes re) {

		Member m = (Member) session.getAttribute("member");
		String id = m.getId();

		Board b = new Board();
		b.setId(id);
		b.setTitle(title);
		b.setContent(content);

		bs.boardAdd(b);
		
		re.addAttribute("num",1);
		
		return "redirect:boardPage";
	}

	// 게시판 상세 조회 킈~
	@RequestMapping("boardDetails")
	public String boardDetails(HttpSession session, Model model, int num) {

		Board b = bs.boardDetail(num);

		System.out.println(b);

		Member m = (Member) session.getAttribute("member");

		if (m == null) {
			model.addAttribute("id", null);

		} else {
			String id = m.getId();
			model.addAttribute("id", id);
		}

		model.addAttribute("board", b);

		return "boardDetail";
	}

	// 게시판 조아따
	@ResponseBody
	@RequestMapping("boardLike")
	public int[] boardLike(HttpSession session, Model model, int num) {

		Member m = (Member) session.getAttribute("member");

		System.out.println(m.getId());
		m.setPhone(num);
		String check = bs.boardLike(m);
		int count = 0;
		int[] a = new int[2];

		if (check == null) {
			bs.likeUp(m);
			count = bs.likefind(m);
			a[0] = count;
			a[1] = 0;
			return a;

		} else {
			bs.likeDown(m);
			count = bs.likefind(m);
			a[0] = count;
			a[1] = 1;
			return a;
		}

	}

}