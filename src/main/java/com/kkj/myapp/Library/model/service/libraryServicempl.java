package com.kkj.myapp.Library.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkj.myapp.Library.model.dao.libraryDao;
import com.kkj.myapp.Library.model.vo.Library;
import com.kkj.myapp.Member.model.vo.Member;

@Service
public class libraryServicempl implements libraryService {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Autowired
	private libraryDao ld;

	@Override
	public ArrayList<Library> libraryPage() {

		return ld.libraryPage(sqlsession);

	}

	@Override
	public Library detailsPage(int page) {

		return ld.detailsPge(page, sqlsession);
	}

	@Override
	public void reservation(Member m) {

		ld.reservation(m, sqlsession);
	}

	@Override
	public void addbook(Library lib) {

		ld.addBook(lib, sqlsession);

	}

	@Override
	public String idCheck(Library lib) {
		return ld.idCheck(lib, sqlsession);
	}

	@Override
	public void bookAA(Library lib) {

		ld.bookAA(lib, sqlsession);
	}

	@Override
	public void bookB(int num) {
		ld.bookB(num, sqlsession);

	}

	@Override
	public void bookC(int num) {
		ld.bookC(num, sqlsession);

	}

	@Override
	public ArrayList<Library> myBooks(Member m) {

		return ld.myBooks(m, sqlsession);
	}

	@Override
	public ArrayList<Library> libraryselect(Library b) {

		return ld.libraryselect(b, sqlsession);

	}

}
