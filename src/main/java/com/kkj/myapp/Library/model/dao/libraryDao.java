package com.kkj.myapp.Library.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kkj.myapp.Library.model.vo.Library;
import com.kkj.myapp.Member.model.vo.Member;

@Repository
public class libraryDao {

	public ArrayList<Library> libraryPage(SqlSessionTemplate sqlsession) {

		return (ArrayList) sqlsession.selectList("libraryMapper.bookAllList");

	}

	public Library detailsPge(int page, SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("libraryMapper.detailsBook", page);
	}

	public void reservation(Member m, SqlSessionTemplate sqlsession) {
		sqlsession.update("libraryMapper.reservationBook", m);
	}

	public void addBook(Library lib, SqlSessionTemplate sqlsession) {
		sqlsession.insert("libraryMapper.addBook", lib);
	}

	public String idCheck(Library lib, SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("libraryMapper.idCheck", lib);
	}

	public void bookAA(Library lib, SqlSessionTemplate sqlsession) {
		sqlsession.update("libraryMapper.bookAA", lib);

	}

	public void bookB(int num, SqlSessionTemplate sqlsession) {
		sqlsession.update("libraryMapper.bookB", num);

	}

	public void bookC(int num, SqlSessionTemplate sqlsession) {
		sqlsession.update("libraryMapper.bookC", num);

	}

	public ArrayList<Library> myBooks(Member m, SqlSessionTemplate sqlsession) {
		return (ArrayList) sqlsession.selectList("libraryMapper.myBooks", m);

	}

	public ArrayList<Library> libraryselect(Library b, SqlSessionTemplate sqlsession) {
		return (ArrayList) sqlsession.selectList("libraryMapper.libraryselect" ,b);
	}

}
