package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Assess;

public interface AssessMapper {

	//返回所有记录
	public List<Assess> findAssessList();
	
	//查询多条记录
	public List<Assess> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertAssess(Assess assess);

	//根据ID删除
	public int deleteAssess(int id);
	
	//更新
	public int updateAssess(Assess assess);
	
	//根据ID得到对应的记录
	public Assess queryAssessById(int id);
	
}

