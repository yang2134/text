package com.model;

/**
* (movies)电影实体类
*/
public class Movies extends ComData{
	
	private static final long serialVersionUID = 636234235374278L;
	private Integer mid;    //ID
	private Integer tid;    //影片分类
	private String tname;
	private String title;    //电影名称
	private String pic;    //图片
	private String daoy;    //导演
	private String zhuy;    //主演
	private String shic;    //时长
	private String memo;    //电影简介
	private String matime;    //发布时间

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getDaoy() {
		return daoy;
	}

	public void setDaoy(String daoy) {
		this.daoy = daoy;
	}

	public String getZhuy() {
		return zhuy;
	}

	public void setZhuy(String zhuy) {
		this.zhuy = zhuy;
	}

	public String getShic() {
		return shic;
	}

	public void setShic(String shic) {
		this.shic = shic;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getMatime() {
		return matime;
	}

	public void setMatime(String matime) {
		this.matime = matime;
	}

}

