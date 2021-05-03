package com.bit.myblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.myblog.vo.BlogVo;

@Repository
public class BlogRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(BlogVo vo) {
		return sqlSession.insert("blog.insert", vo) == 1;
	}

	public BlogVo findById(String user_id) {
		return sqlSession.selectOne("blog.findById", user_id);
	}

	public List<BlogVo> findAllBlog(int curPageNum) {
		return sqlSession.selectList("blog.findAllBlog", curPageNum);
	}

	public boolean update(BlogVo vo) {
		return sqlSession.update("blog.update", vo) == 1;
	}

	public int getCount() {
		return sqlSession.selectOne("blog.getCount");
	}

	public boolean delete(String id) {
		return sqlSession.delete("blog.delete", id) == 1;
	}

	public List<BlogVo> findByKeyword(BlogVo vo) {
		return sqlSession.selectList("blog.findByKeyword", vo);
	}

	

}
