package com.bit.myblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.dto.JsonResult;
import com.bit.myblog.service.UserService;

@Controller("userApiController")
@RequestMapping("/api/user")
public class UserController {
	
	@Autowired	
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/existid")
	public JsonResult existId(String id) {
		Boolean result = userService.existUser(id);
		return JsonResult.success(result);
	}

}
