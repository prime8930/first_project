package com.bit.myblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.myblog.repository.BlogRepository;
import com.bit.myblog.vo.BlogVo;


@Service
public class BlogService {
	
	@Autowired
	private BlogRepository blogRepository;

	public BlogVo findMyBlog(String user_id) {
		return blogRepository.findById(user_id);
	}

	public boolean join(BlogVo vo) {
		return blogRepository.insert(vo);
	}
	
	public List<BlogVo> findAllBlog(int curPageNum) {
		return blogRepository.findAllBlog((curPageNum - 1) *3);
	}

	public boolean update(BlogVo vo) {
		return blogRepository.update(vo);
	}

	public int getCount() {
		return blogRepository.getCount();
	}

	public boolean delete(String id) {
		return blogRepository.delete(id);
	}

	public int findCountByKeyword(String keyword) {
		BlogVo blogVo = new BlogVo();
		blogVo.setKeyword(keyword);
		return blogRepository.findCountByKeyword(blogVo);
	}

	public List<BlogVo> findByKeyword(String keyword, int curPage) {
		BlogVo blogVo = new BlogVo();
		blogVo.setCurPage((curPage-1)*3);
		blogVo.setKeyword(keyword);
		return blogRepository.findByKeyword(blogVo);
	}

}
