package com.kkj.myapp.Board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkj.myapp.Board.model.dao.boardDao;
import com.kkj.myapp.Board.model.vo.Board;
import com.kkj.myapp.Board.model.vo.PagingVO;
import com.kkj.myapp.Member.model.vo.Member;

@Service
public class boardServicempl implements boardService {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Autowired
	private boardDao bd;

	@Override
	public ArrayList<Board> boardList(PagingVO pv) {
		return bd.boardList(pv,sqlsession);
	}

	@Override
	public void boardAdd(Board b) {
		bd.boardAdd(b, sqlsession);
	}

	@Override
	public Board boardDetail(int num) {

		bd.boardSee(num, sqlsession);

		return bd.boardDetail(num, sqlsession);
	}

	@Override
	public void boardDel(int num) {
		bd.boardDel(num, sqlsession);
	}

	@Override
	public String boardLike(Member m) {
		return bd.boardLike(m,sqlsession);
	}

	@Override
	public void likeUp(Member m) {
		bd.likeUp(m,sqlsession);
	}

	@Override
	public void likeDown(Member m) {
		bd.likeDown(m,sqlsession);
		
	}

	@Override
	public int likefind(Member m) {
		return bd.likeFind(m,sqlsession);
	}

	@Override
	public int pageNum() {
		return bd.pageNum(sqlsession);
	}

}
