package com.model;

/**
* (news)资讯实体类
*/
public class News extends ComData{
	
	private static final long serialVersionUID = 318278764516551L;
	private Integer nid;    //ID
	private String title;    //标题
	private String photo;    //资讯图片
	private String memo;    //资讯内容
	private String ntime;    //发布时间

	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getNtime() {
		return ntime;
	}

	public void setNtime(String ntime) {
		this.ntime = ntime;
	}

}

