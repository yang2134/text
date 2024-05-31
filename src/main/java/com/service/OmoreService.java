package com.service;
import java.util.List;

import com.model.Omore;
import com.util.PageBean;

public interface OmoreService{
	
	//查询多条记录
	public List<Omore> queryOmoreList(Omore omore,PageBean page) throws Exception;
 
	//添加
	public int insertOmore(Omore omore) throws Exception ;
	
	//根据ID删除
	public int deleteOmore(int id) throws Exception ;
	
	//更新
	public int updateOmore(Omore omore) throws Exception ;
	
	//根据ID查询单条数据
	public Omore queryOmoreById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Omore omore);

}

