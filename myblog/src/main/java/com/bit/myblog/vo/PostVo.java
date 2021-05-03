package com.bit.myblog.vo;

import javax.validation.constraints.NotEmpty;

public class PostVo {
	private Long no;
	
	@NotEmpty
	private String title;
	private String author;
	
	@NotEmpty
	private String content;
	
	private String attach_file;
	private String w_date;
	private String blog_id;
	
	private String keyword;
	
	// post 페이징을 위한 필드와 get/set 메소드
	private int curPage;
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public String getAttach_file() {
		return attach_file;
	}

	public void setAttach_file(String attach_file) {
		this.attach_file = attach_file;
	}

	public String getW_date() {
		return w_date;
	}
	
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	
	public String getBlog_id() {
		return blog_id;
	}
	
	public void setBlog_id(String blog_id) {
		this.blog_id = blog_id;
	}

	@Override
	public String toString() {
		return "PostVo [no=" + no + ", title=" + title + ", author=" + author + ", content=" + content
				+ ", attach_file=" + attach_file + ", w_date=" + w_date + ", blog_id=" + blog_id + ", keyword="
				+ keyword + ", curPage=" + curPage + "]";
	}

	

	
}
