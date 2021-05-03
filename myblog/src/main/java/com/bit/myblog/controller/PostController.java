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
import com.bit.myblog.service.BlogService;
import com.bit.myblog.service.CommentService;
import com.bit.myblog.service.FileUploadService;
import com.bit.myblog.service.PostService;
import com.bit.myblog.service.ReplyService;
import com.bit.myblog.vo.BlogVo;
import com.bit.myblog.vo.CommentVo;
import com.bit.myblog.vo.PageVo;
import com.bit.myblog.vo.PostVo;
import com.bit.myblog.vo.ReplyVo;

@Controller
@RequestMapping("/{id}/post")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping("")
	public String index(Model model, @PathVariable("id") String id, @RequestParam(value="page", required=false) String pageNum) {
		PageVo pageVo = new PageVo(pageNum, postService.getCount(id), 5);
		
	 	List<PostVo> postVo = postService.findAllPost(id, pageVo.getCurPage());
	 	BlogVo blogVo = blogService.findMyBlog(id);
	 	
	 	if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
			return "redirect:/{id}/post";
		}
		
		model.addAttribute("blogVo", blogVo);
		model.addAttribute("postVo", postVo);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("id", id);

		return "post/index";
	}
	
	@RequestMapping("/view/{no}")
	public String view(@PathVariable("no") Long no, @PathVariable("id") String id, Model model) {
		PostVo vo = postService.findByNo(no);
		List<CommentVo> commentVo = commentService.findAllComment(no);
		List<ReplyVo> replyVo = replyService.findAllReply(no);
		model.addAttribute("vo", vo);
		model.addAttribute("no", no);
		model.addAttribute("id", id);
		model.addAttribute("commentVo", commentVo);
		model.addAttribute("replyVo", replyVo);
		return "post/view";
	}
	
	@Auth
	@RequestMapping(value="/view/{no}/update", method=RequestMethod.GET)
	public String update(@PathVariable("id") String id, @PathVariable("no") Long no, Model model) {
		PostVo postVo = postService.findByNo(no);
		model.addAttribute("id", id);
		model.addAttribute("no", no);
		model.addAttribute("postVo", postVo);
		return "post/update";
	}
	
	@Auth
	@RequestMapping(value="/view/{no}/update", method=RequestMethod.POST)
	public String update(PostVo vo, @PathVariable("no") Long no, @RequestParam("file") MultipartFile file) {
		if(file.getOriginalFilename().equals("")) {
			vo.setOrigin_file("");
			vo.setStored_file("");
		} else {
			vo = postService.findByNo(no);
			fileUploadService.postDelete(vo, uploadPath);
			List<String> list = fileUploadService.uploadFile(file, uploadPath);
			vo.setOrigin_file(list.get(0));
			vo.setStored_file(list.get(1));
		}
		vo.setNo(no);
		postService.update(vo);
		return "redirect:/{id}/post/view/{no}";
	}
	
	@Auth
	@RequestMapping(value="/view/{no}/delete")
	public String delete(@RequestParam("result") String result, @PathVariable("no") Long no, @PathVariable("id") String id) {
		if(result.equals("true")) {
			PostVo postVo = postService.findByNo(no);
			fileUploadService.postDelete(postVo, uploadPath);
			postService.delete(no);
		}
		return "redirect:/" + id;
	}
	
	
	@Auth
	@RequestMapping(value="/{no}/comment", method=RequestMethod.POST)
	public String commentAdd(CommentVo vo, @PathVariable("no") Long no) {
		vo.setPost_no(no);
		commentService.insert(vo);
		return "redirect:/{id}/post/view/{no}";
	}
	
	@Auth
	@RequestMapping("/view/{no}/comment/delete/{commentno}")
	public String commentDelete(@PathVariable("commentno") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			commentService.delete(no);
		}
		
		return "redirect:/{id}/post/view/{no}";
	}
	
	@Auth
	@RequestMapping(value="/{no}/comment/{commentno}/reply", method=RequestMethod.POST)
	public String replyAdd(ReplyVo vo, @PathVariable("no") Long no, @PathVariable("commentno") Long commentno) {
		vo.setPost_no(no);
		vo.setComment_no(commentno);
		replyService.insert(vo);
		return "redirect:/{id}/post/view/{no}";
	}
	
	@Auth
	@RequestMapping("/view/{no}/reply/delete/{replyno}")
	public String replyDelete(@PathVariable("replyno") Long no, @RequestParam("result") String result) {
		if(result.equals("true")) {
			replyService.delete(no);
		}
		
		return "redirect:/{id}/post/view/{no}";
	}
	
	@RequestMapping("/search")
	public String postSearch(@PathVariable("id") String id, @RequestParam(value="keyword", required=false) String keyword, Model model, @RequestParam(value="page", required=false) String pageNum) {
		
		int searchCount = postService.findCountByKeyword(id, keyword);
		PageVo pageVo = new PageVo(pageNum, searchCount, 5);
		List<PostVo> postVo = postService.findByKeyword(id, keyword, pageVo.getCurPage());
		
		
		if(pageVo.pageOverAndUnder(pageVo.getCurPage())) {
			return "redirect:/";
		}
		
		model.addAttribute("postVo", postVo);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("id", id);
		
		return "post/search";
	}


}
