package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Collects;

public interface CollectsMapper {

	//返回所有记录
	public List<Collects> findCollectsList();
	
	//查询多条记录
	public List<Collects> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertCollects(Collects collects);

	//根据ID删除
	public int deleteCollects(int id);
	
	//更新
	public int updateCollects(Collects collects);
	
	//根据ID得到对应的记录
	public Collects queryCollectsById(int id);
	
}

