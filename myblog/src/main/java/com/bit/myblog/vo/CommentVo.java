package com.bit.myblog.vo;

public class CommentVo {

	private Long no;
	private String writer;
	private String content;
	private String w_date;
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
	
	public String getW_date() {
		return w_date;
	}
	
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}

	public Long getPost_no() {
		return post_no;
	}

	public void setPost_no(Long post_no) {
		this.post_no = post_no;
	}

	@Override
	public String toString() {
		return "CommentVo [no=" + no + ", writer=" + writer + ", content=" + content + ", w_date=" + w_date
				+ ", post_no=" + post_no + "]";
	}

}
