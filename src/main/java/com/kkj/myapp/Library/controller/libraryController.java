package com.kkj.myapp.Library.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kkj.myapp.Library.model.service.libraryService;
import com.kkj.myapp.Library.model.vo.Library;
import com.kkj.myapp.Member.model.vo.Member;

@Controller
public class libraryController {

	@Autowired
	private libraryService ls;

	// 도서 메인 페이지 리스트 조회
	@RequestMapping("libraryPage")
	public String libraryPage(HttpSession session, Model model, @RequestParam(required = false) String name) {
		ArrayList<Library> libs;

		if (name == null) {
			libs = ls.libraryPage();

		} else {
			Library b = new Library();
			b.setName(name);
			libs = ls.libraryselect(b);

		}

		Member m = (Member) session.getAttribute("member");

		model.addAttribute("name", m.getName());

		model.addAttribute("libList", libs);

		return "library";
	}

	// 개인도서 조회
	@RequestMapping("myBooks")
	public String myBooks(HttpSession session, Model model) {

		Member m = (Member) session.getAttribute("member");

		ArrayList<Library> libs = ls.myBooks(m);

		model.addAttribute("name", m.getName());

		model.addAttribute("libList", libs);

		return "myPage2";
	}

	// 도서 상세 조회
	@RequestMapping("detailsPage")
	public String detailsPage(int page, Model model) {

		Library lib = ls.detailsPage(page);

		model.addAttribute("book", lib);

		return "libraryAdd";
	}

	@RequestMapping("reservation")
	public String reservation(int num, Model model, HttpSession session) {

		Member m = (Member) session.getAttribute("member");

		m.setPhone(num);

		ls.reservation(m);

		Library lib = ls.detailsPage(num);

		model.addAttribute("book", lib);

		return "libraryAdd";
	}

	@RequestMapping("masterBookAdd")
	public String masterBookAdd(String name) {

		return "masterAdd";
	}

	@RequestMapping("masterBookAdb")
	public String masterBookAdb(Model model) {

		ArrayList<Library> libs = ls.libraryPage();

		model.addAttribute("libList", libs);

		return "masterAdb";
	}

	@RequestMapping("bookAdd")
	public String bookAdd(MultipartFile file, String name, HttpServletRequest request) {

		System.out.println(file);

		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		long resTime = System.currentTimeMillis();

		String fileName = resTime + file.getOriginalFilename();

		System.out.println(fileName);

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\assets\\img\\library\\";

		System.out.println(resources);
		System.out.println(savePath);

		try {

			file.transferTo(new File(savePath + fileName));

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Library lib = new Library();

		lib.setName(name);
		lib.setPicture(fileName);

		ls.addbook(lib);

		return "masterAdd";
	}

	@ResponseBody
	@RequestMapping("booka")
	public String bookA(String id) {

		String data = "";

		Library lib = new Library();

		lib.setId(id);

		String check = ls.idCheck(lib);
		if (check == null) {
			data = "false";
			System.out.println(data);
			return data;

		} else {
			data = "true";
			System.out.println(data);

			return data;
		}

	}

	@RequestMapping("bookaa")
	public String bookAA(int num, String input, Model model) {

		Library lib = new Library();

		lib.setId(input);
		lib.setNum(num);

		System.out.println(input);
		System.out.println(num);

		ls.bookAA(lib);

		ArrayList<Library> libs = ls.libraryPage();

		model.addAttribute("libList", libs);

		return "masterAdb";
	}

	@RequestMapping("bookb")
	public String bookB(int num, Model model) {

		ls.bookB(num);

		ArrayList<Library> libs = ls.libraryPage();

		model.addAttribute("libList", libs);

		return "masterAdb";
	}

	@RequestMapping("bookc")
	public String bookC(int num, Model model) {

		ls.bookC(num);

		ArrayList<Library> libs = ls.libraryPage();

		model.addAttribute("libList", libs);

		return "masterAdb";
	}
}
