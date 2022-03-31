package com.kkj.myapp.Board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kkj.myapp.Board.model.vo.Board;
import com.kkj.myapp.Board.model.vo.PageInfo;
import com.kkj.myapp.Member.model.vo.Member;

@Repository
public class boardDao {

	public ArrayList<Board> boardList(PageInfo pi, SqlSessionTemplate sqlsession) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlsession.selectList("boardMapper.boardList", null, rowBounds);
	}

	public void boardAdd(Board b, SqlSessionTemplate sqlsession) {
		sqlsession.insert("boardMapper.boardAdd", b);
	}

	public Board boardDetail(int num, SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("boardMapper.boardDetail", num);
	}

	public void boardDel(int num, SqlSessionTemplate sqlsession) {
		sqlsession.delete("boardMapper.boardDel", num);
	}

	public void boardSee(int num, SqlSessionTemplate sqlsession) {
		sqlsession.update("boardMapper.boardSee", num);
	}

	public String boardLike(Member m, SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("boardMapper.boardLike", m);
	}

	public void likeUp(Member m, SqlSessionTemplate sqlsession) {
		sqlsession.insert("boardMapper.upLike", m);
	}

	public void likeDown(Member m, SqlSessionTemplate sqlsession) {
		sqlsession.delete("boardMapper.downLike", m);
	}

	public int likeFind(Member m, SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("boardMapper.likeFind", m);
	}

	public int pageNum(SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("boardMapper.pageNum");
	}

}
