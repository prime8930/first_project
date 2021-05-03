package com.bit.myblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.myblog.vo.ReplyVo;

@Repository
public class ReplyRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public boolean insert(ReplyVo vo) {
		return sqlSession.insert("reply.insert", vo) == 1;
	}

	public List<ReplyVo> findAllReply(Long no) {
		return sqlSession.selectList("reply.findAllReply", no);
	}

	public boolean delete(Long no) {
		return sqlSession.delete("reply.delete", no) == 1;
	}

}
