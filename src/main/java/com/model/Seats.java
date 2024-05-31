package com.model;

/**
* (seats)座位实体类
*/
public class Seats extends ComData{
	
	private static final long serialVersionUID = 741782646842682L;
	private Integer sid;    //ID
	private Integer rid;    //放映厅
	private String rname;
	private Integer pai;    //排
	private Integer hao;    //号

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
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

	public Integer getPai() {
		return pai;
	}

	public void setPai(Integer pai) {
		this.pai = pai;
	}

	public Integer getHao() {
		return hao;
	}

	public void setHao(Integer hao) {
		this.hao = hao;
	}

}

