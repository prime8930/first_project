package com.bit.myblog.vo;

public class ReplyVo {

	private Long no;
	private String writer;
	private String content;
	private String reg_date;
	private Long comment_no;
	private Long post_no;
	
	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	public Long getComment_no() {
		return comment_no;
	}
	
	public void setComment_no(Long comment_no) {
		this.comment_no = comment_no;
	}

	public Long getPost_no() {
		return post_no;
	}

	public void setPost_no(Long post_no) {
		this.post_no = post_no;
	}

	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", writer=" + writer + ", content=" + content + ", reg_date=" + reg_date
				+ ", comment_no=" + comment_no + ", post_no=" + post_no + "]";
	}
	
	
	

}
