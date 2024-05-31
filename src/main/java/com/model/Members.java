package com.model;

/**
* (members)用户实体类
*/
public class Members extends ComData{
	
	private static final long serialVersionUID = 728761435623115L;
	private Integer meid;    //ID
	private String mname;    //微信昵称
	private String photo;    //头像
	private String sname;    //姓名
	private String tel;    //手机号码
	private String address;    //联系地址
	private String qq;    //QQ
	private String email;    //电子邮箱
	private String matime;    //注册时间

	public Integer getMeid() {
		return meid;
	}

	public void setMeid(Integer meid) {
		this.meid = meid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMatime() {
		return matime;
	}

	public void setMatime(String matime) {
		this.matime = matime;
	}

}

