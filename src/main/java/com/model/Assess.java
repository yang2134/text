package com.model;

/**
* (assess)电影评论实体类
*/
public class Assess extends ComData{
	
	private static final long serialVersionUID = 752761446236122L;
	private Integer aid;    //ID
	private Integer mid;    //电影
	private String title;
	private Integer meid;    //用户id
	private Integer ascore;    //评分
	private String amemo;    //评语
	private String atime;    //评论时间

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getMeid() {
		return meid;
	}

	public void setMeid(Integer meid) {
		this.meid = meid;
	}

	public Integer getAscore() {
		return ascore;
	}

	public void setAscore(Integer ascore) {
		this.ascore = ascore;
	}

	public String getAmemo() {
		return amemo;
	}

	public void setAmemo(String amemo) {
		this.amemo = amemo;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

}

