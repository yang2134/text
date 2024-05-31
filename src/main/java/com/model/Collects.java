package com.model;

/**
* (collects)收藏夹实体类
*/
public class Collects extends ComData{
	
	private static final long serialVersionUID = 341384466758588L;
	private Integer cid;    //ID
	private Integer mid;    //电影id
	private Integer meid;    //用户id
	private String atime;    //收藏时间

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getMeid() {
		return meid;
	}

	public void setMeid(Integer meid) {
		this.meid = meid;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

}

