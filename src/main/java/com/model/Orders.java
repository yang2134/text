package com.model;

/**
* (orders)购票实体类
*/
public class Orders extends ComData{
	
	private static final long serialVersionUID = 251165556735326L;
	private Integer oid;    //订单编号
	private Integer mid;    //影片
	private String title;
	private Integer rid;    //放映厅
	private String rname;
	private String rdate;    //日期
	private Integer quan;    //数量
	private Object smoney;    //总金额
	private Integer meid;    //用户id
	private String atime;    //购票时间
	private String ostext;    //座位

	private  Integer pid;    //放映计划

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
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

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public Integer getQuan() {
		return quan;
	}

	public void setQuan(Integer quan) {
		this.quan = quan;
	}

	public Object getSmoney() {
		return smoney;
	}

	public void setSmoney(Object smoney) {
		this.smoney = smoney;
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

	public String getOstext() {
		return ostext;
	}

	public void setOstext(String ostext) {
		this.ostext = ostext;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

}

