package com.bit.myblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.myblog.repository.UserRepository;
import com.bit.myblog.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;

	public void join(UserVo vo) {
		userRepository.insert(vo);
	}

	public UserVo getUser(UserVo vo) {
		return userRepository.findByIdAndPassword(vo);
	}

	public UserVo getUser(String id) {
		return userRepository.findById(id);
	}

	public void updateUser(UserVo vo) {
		userRepository.update(vo);
	}

	public Boolean existUser(String id) {
		UserVo vo = userRepository.existUser(id);
		return vo != null;
	}

}
