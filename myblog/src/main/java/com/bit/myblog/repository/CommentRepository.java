package com.bit.myblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.myblog.vo.CommentVo;

@Repository
public class CommentRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public List<CommentVo> findAllComment(Long no) {
		return sqlSession.selectList("comment.findAllComment", no);
	}

	public boolean insert(CommentVo vo) {
		return sqlSession.insert("comment.insert", vo) == 1;
	}

	public boolean delete(Long no) {
		return sqlSession.delete("comment.delete", no) == 1;
	}

}
