package com.kkj.myapp.Library.model.service;

import java.util.ArrayList;

import com.kkj.myapp.Library.model.vo.Library;
import com.kkj.myapp.Member.model.vo.Member;

public interface libraryService {

	ArrayList<Library> libraryPage();

	Library detailsPage(int page);

	void reservation(Member m);

	void addbook(Library lib);

	String idCheck(Library lib);

	void bookAA(Library lib);

	void bookB(int num);

	void bookC(int num);

	ArrayList<Library> myBooks(Member m);

	ArrayList<Library> libraryselect(Library b);

}
