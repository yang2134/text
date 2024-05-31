package com.service;
import java.util.List;

import com.model.Plans;
import com.util.PageBean;

public interface PlansService{
	
	//查询多条记录
	public List<Plans> queryPlansList(Plans plans,PageBean page) throws Exception;
 
	//添加
	public int insertPlans(Plans plans) throws Exception ;
	
	//根据ID删除
	public int deletePlans(int id) throws Exception ;
	
	//更新
	public int updatePlans(Plans plans) throws Exception ;
	
	//根据ID查询单条数据
	public Plans queryPlansById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Plans plans);

}

