package com.kkj.myapp.Board.model.service;

import java.util.ArrayList;

import com.kkj.myapp.Board.model.vo.Board;
import com.kkj.myapp.Board.model.vo.PagingVO;
import com.kkj.myapp.Library.model.vo.Library;
import com.kkj.myapp.Member.model.vo.Member;

public interface boardService {

	

	ArrayList<Board> boardList(PagingVO pv);

	void boardAdd(Board b);

	Board boardDetail(int num);

	void boardDel(int num);

	String boardLike(Member m);

	void likeUp(Member m);

	void likeDown(Member m);

	int likefind(Member m);

	int pageNum();

}
