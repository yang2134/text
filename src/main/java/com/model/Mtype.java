package com.model;

/**
* (mtype)影片分类实体类
*/
public class Mtype extends ComData{
	
	private static final long serialVersionUID = 416367432126777L;
	private Integer tid;    //ID
	private String tname;    //分类名称

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

}

