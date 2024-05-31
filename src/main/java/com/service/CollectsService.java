package com.service;
import java.util.List;

import com.model.Collects;
import com.util.PageBean;

public interface CollectsService{
	
	//查询多条记录
	public List<Collects> queryCollectsList(Collects collects,PageBean page) throws Exception;
 
	//添加
	public int insertCollects(Collects collects) throws Exception ;
	
	//根据ID删除
	public int deleteCollects(int id) throws Exception ;
	
	//更新
	public int updateCollects(Collects collects) throws Exception ;
	
	//根据ID查询单条数据
	public Collects queryCollectsById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Collects collects);

}

