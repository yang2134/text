package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Omore;

public interface OmoreMapper {

	//返回所有记录
	public List<Omore> findOmoreList();
	
	//查询多条记录
	public List<Omore> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertOmore(Omore omore);

	//根据ID删除
	public int deleteOmore(int id);
	
	//更新
	public int updateOmore(Omore omore);
	
	//根据ID得到对应的记录
	public Omore queryOmoreById(int id);
	
}

