package com.bit.myblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.myblog.vo.BlogVo;
import com.bit.myblog.vo.PostVo;

@Repository
public class PostRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PostVo> findAllPost(BlogVo blogVo) {
		return sqlSession.selectList("post.findAllPost", blogVo);
	}

	public boolean insert(PostVo vo) {
		return sqlSession.insert("post.insert", vo) == 1;
	}

	public PostVo findByNo(Long no) {
		return sqlSession.selectOne("post.findByNo", no);
	}

	public List<PostVo> findById(String user_id) {
		return sqlSession.selectList("post.findById", user_id);
	}

	public boolean delete(Long no) {
		return sqlSession.delete("post.delete", no) == 1;
	}

	public boolean update(PostVo vo) {
		return sqlSession.update("post.update", vo) == 1;
	}

	public int getCount(String id) {
		return sqlSession.selectOne("post.getCount", id);
	}

	public List<PostVo> findByKeyword(PostVo vo) {
		return sqlSession.selectList("post.findByKeyword" , vo);
	}

	public int findCountByKeyword(PostVo vo) {
		return sqlSession.selectOne("post.findCountByKeyword", vo);
	}

}
