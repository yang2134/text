package com.model;

/**
* (plans)放映计划实体类
*/
public class Plans extends ComData{
	
	private static final long serialVersionUID = 264754347852238L;
	private Integer pid;    //ID
	private Integer mid;    //影片
	private String title;
	private Integer rid;    //放映厅
	private String rname;
	private String ptime;    //时间
	private String banb;    //版本
	private Object price;    //价格


	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
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

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getPtime() {
		return ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public String getBanb() {
		return banb;
	}

	public void setBanb(String banb) {
		this.banb = banb;
	}

	public Object getPrice() {
		return price;
	}

	public void setPrice(Object price) {
		this.price = price;
	}

}

