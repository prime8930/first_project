package com.bit.myblog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.myblog.service.BlogService;
import com.bit.myblog.vo.BlogVo;
import com.bit.myblog.vo.PageVo;

@Controller
public class MainController {
	
	@Autowired
	private BlogService blogService;

	@RequestMapping("")
	public String index(Model model, @RequestParam(value="page", required=false) String pageNum) {
		
		PageVo pageVo = new PageVo(pageNum, blogService.getCount(), 3);
		List<BlogVo> blogVo = blogService.findAllBlog(pageVo.getCurPage());
		
		if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
			return "redirect:/";
		}
		
		model.addAttribute("blogVo", blogVo);
		model.addAttribute("pageVo", pageVo);
		return "index";
	}

	@RequestMapping("/blog/search")
	public String blogSearch(@RequestParam(value="keyword", required=false) String keyword, Model model, @RequestParam(value="page", required=false) String pageNum) {
		int searchCount = blogService.findCountByKeyword(keyword);
		PageVo pageVo = new PageVo(pageNum, searchCount, 3);
		List<BlogVo> blogVo = blogService.findByKeyword(keyword, pageVo.getCurPage());
		
		if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
			return "redirect:/";
		}
		
		model.addAttribute("blogVo", blogVo);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchCount", searchCount);
		
		return "blog/search";
	}

}
