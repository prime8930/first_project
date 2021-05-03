package com.bit.myblog.vo;

import javax.validation.constraints.NotEmpty;

public class BlogVo {
	private Long no;
	private String user_id;
	
	@NotEmpty
	private String title;
	
	private String o_logo;
	private String t_logo;
	
	@NotEmpty
	private String intro;
	private String reg_date;
	
	private String keyword;
	
	// post 페이징을 위한 필드와 get/set 메소드
	private int curPage;
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public String getO_logo() {
		return o_logo;
	}

	public void setO_logo(String o_logo) {
		this.o_logo = o_logo;
	}

	public String getT_logo() {
		return t_logo;
	}

	public void setT_logo(String t_logo) {
		this.t_logo = t_logo;
	}

	public String getIntro() {
		return intro;
	}
	
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "BlogVo [no=" + no + ", user_id=" + user_id + ", title=" + title + ", o_logo=" + o_logo + ", t_logo="
				+ t_logo + ", intro=" + intro + ", reg_date=" + reg_date + ", keyword=" + keyword + ", curPage="
				+ curPage + "]";
	}

	

	
	
}
