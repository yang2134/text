package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Mtype;

public interface MtypeMapper {

	//返回所有记录
	public List<Mtype> findMtypeList();
	
	//查询多条记录
	public List<Mtype> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertMtype(Mtype mtype);

	//根据ID删除
	public int deleteMtype(int id);
	
	//更新
	public int updateMtype(Mtype mtype);
	
	//根据ID得到对应的记录
	public Mtype queryMtypeById(int id);
	
}

