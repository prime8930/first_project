package com.bit.myblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.myblog.repository.PostRepository;
import com.bit.myblog.vo.BlogVo;
import com.bit.myblog.vo.PostVo;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	public List<PostVo> findAllPost(String id, int curPage) {
		BlogVo blogVo = new BlogVo();
		blogVo.setUser_id(id);
		blogVo.setCurPage((curPage - 1) * 5);
		return postRepository.findAllPost(blogVo);
	}

	public boolean insert(PostVo vo) {
		return postRepository.insert(vo);
	}

	public PostVo findByNo(Long no) {
		return postRepository.findByNo(no);
	}

	public List<PostVo> findById(String user_id) {
		return postRepository.findById(user_id);
	}

	public boolean delete(Long no) {
		return postRepository.delete(no);
		
	}

	public boolean update(PostVo vo) {
		return postRepository.update(vo);
	}

	public int getCount(String id) {
		return postRepository.getCount(id);
	}

	public List<PostVo> findByKeyword(String id, String keyword, int curPage) {
		PostVo postVo = new PostVo();
		postVo.setBlog_id(id);
		postVo.setCurPage((curPage-1) *5);
		postVo.setKeyword(keyword);
		return postRepository.findByKeyword(postVo);
	}

	public int findCountByKeyword(String id, String keyword) {
		PostVo postVo = new PostVo();
		postVo.setKeyword(keyword);
		return postRepository.findCountByKeyword(postVo);
	}

}
