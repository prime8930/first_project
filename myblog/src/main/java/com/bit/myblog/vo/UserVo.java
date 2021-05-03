package com.bit.myblog.vo;

import javax.validation.constraints.NotEmpty;

public class UserVo {

	@NotEmpty(message = "필수 입력 사항입니다.")
	private String id;
	
	@NotEmpty(message = "필수 입력 사항입니다.")
	private String password;
	
	@NotEmpty(message = "필수 입력 사항입니다.")
	private String name;
	private String join_date;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getJoin_date() {
		return join_date;
	}
	
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", password=" + password + ", name=" + name + ", join_date=" + join_date + "]";
	}
	
	
	
	
}
