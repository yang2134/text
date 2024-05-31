package com.model;

/**
* (admin)管理员实体类
*/
public class Admin extends ComData{
	
	private static final long serialVersionUID = 518753833246524L;
	private Integer adminid;    //管理员ID
	private String adminaccount;    //管理员账号
	private String adminpassword;    //管理员密码
	private String adminrole;    //身份

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public String getAdminaccount() {
		return adminaccount;
	}

	public void setAdminaccount(String adminaccount) {
		this.adminaccount = adminaccount;
	}

	public String getAdminpassword() {
		return adminpassword;
	}

	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}

	public String getAdminrole() {
		return adminrole;
	}

	public void setAdminrole(String adminrole) {
		this.adminrole = adminrole;
	}

}

