package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Plans;

public interface PlansMapper {

	//返回所有记录
	public List<Plans> findPlansList();
	
	//查询多条记录
	public List<Plans> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertPlans(Plans plans);

	//根据ID删除
	public int deletePlans(int id);
	
	//更新
	public int updatePlans(Plans plans);
	
	//根据ID得到对应的记录
	public Plans queryPlansById(int id);
	
}

