package com.model;

/**
* (rooms)放映厅实体类
*/
public class Rooms extends ComData{
	
	private static final long serialVersionUID = 528612254568641L;
	private Integer rid;    //ID
	private String rname;    //放映厅名称

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

}

