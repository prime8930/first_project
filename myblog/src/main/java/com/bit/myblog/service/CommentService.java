package com.bit.myblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.myblog.repository.CommentRepository;
import com.bit.myblog.vo.CommentVo;
import com.bit.myblog.vo.PostVo;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;

	public List<CommentVo> findAllComment(Long no) {
		return commentRepository.findAllComment(no);
	}

	public boolean insert(CommentVo vo) {
		return commentRepository.insert(vo);
	}

	public boolean delete(Long no) {
		return commentRepository.delete(no);
	}

}
