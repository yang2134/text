package com.model;

/**
* (omore)订单详情实体类
*/
public class Omore extends ComData{
	
	private static final long serialVersionUID = 576388841188118L;
	private Integer id;    //ID
	private Integer oid;    //订单编号
	private Integer sid;    //座位编号
	private Integer pid;    //计划ID

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

}

