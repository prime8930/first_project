package com.bit.myblog.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.myblog.security.Auth;
import com.bit.myblog.security.AuthUser;
import com.bit.myblog.service.BlogService;
import com.bit.myblog.service.FileUploadService;
import com.bit.myblog.service.PostService;
import com.bit.myblog.vo.BlogVo;
import com.bit.myblog.vo.PostVo;
import com.bit.myblog.vo.UserVo;

@Controller
@RequestMapping("{id}")
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private PostService postService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Auth
	@RequestMapping("")
	public String index(@AuthUser UserVo vo, Model model) {
		String user_id = vo.getId();
		BlogVo blogVo = blogService.findMyBlog(user_id);
		
		if(blogVo == null) {
			model.addAttribute("user_id", user_id);
			return "blog/join";
		}
		
		return "redirect:/{id}/post";
	}
	
	@Auth
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(BlogVo vo, @RequestParam("file") MultipartFile file) {
		String path = fileUploadService.uploadLogo(file, uploadPath);
		vo.setO_logo(path.split(",")[0]);
		vo.setT_logo(path.split(",")[1]);
		blogService.join(vo);
		return "redirect:/{id}/post";
	}
	
	
	@Auth
	@RequestMapping(value="/post/add", method=RequestMethod.GET)
	public String add(@AuthUser UserVo vo, Model model) {
		model.addAttribute("vo", vo);
		return "blog/add";
	}
	
	@Auth
	@RequestMapping(value="/post/add", method=RequestMethod.POST)
	public String add(PostVo vo, @RequestParam("file") MultipartFile file) {
		if(file.getOriginalFilename().equals("")) {
			vo.setOrigin_file(null);
		} else {
			List<String> list = fileUploadService.uploadFile(file, uploadPath);
			vo.setOrigin_file(list.get(0));
			vo.setStored_file(list.get(1));
		}
		postService.insert(vo);
		return "redirect:/" + vo.getBlog_id();
	}
	
	
	
	@Auth
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(@PathVariable("id") String id, Model model) {
		BlogVo blogVo = blogService.findMyBlog(id);
		model.addAttribute("id", id);
		model.addAttribute("blogVo", blogVo);
		return "blog/update";
	}
	
	@Auth
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(BlogVo vo, @RequestParam("file") MultipartFile file) {
		if(file.getOriginalFilename().equals("")) {
			vo.setO_logo("");
		} else {
			if(fileUploadService.blogDelete(vo, uploadPath)) {
				String path = fileUploadService.uploadLogo(file, uploadPath);
				vo.setO_logo(path.split(",")[0]);
				vo.setT_logo(path.split(",")[1]);
			}
		}
		blogService.update(vo);
		return "redirect:/" + vo.getUser_id();
	}
	
	@Auth
	@RequestMapping("/delete")
	public String blogDelete(@PathVariable("id") String id, @RequestParam("result") String result) {
		if(result.equals("true")) {
			BlogVo blogVo = blogService.findMyBlog(id);
			fileUploadService.blogDelete(blogVo, uploadPath);
			blogService.delete(id);
		}
		return "redirect:/{id}";
	}
	
	
}











