package com.bit.myblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.myblog.repository.ReplyRepository;
import com.bit.myblog.vo.ReplyVo;

@Service
public class ReplyService {

	
	@Autowired
	private ReplyRepository replyRepository;
	
	
	public boolean insert(ReplyVo vo) {
		return replyRepository.insert(vo);
	}


	public List<ReplyVo> findAllReply(Long no) {
		return replyRepository.findAllReply(no);
	}


	public boolean delete(Long no) {
		return replyRepository.delete(no);
		
	}

}
