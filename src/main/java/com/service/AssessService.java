package com.service;
import java.util.List;

import com.model.Assess;
import com.util.PageBean;

public interface AssessService{
	
	//查询多条记录
	public List<Assess> queryAssessList(Assess assess,PageBean page) throws Exception;
 
	//添加
	public int insertAssess(Assess assess) throws Exception ;
	
	//根据ID删除
	public int deleteAssess(int id) throws Exception ;
	
	//更新
	public int updateAssess(Assess assess) throws Exception ;
	
	//根据ID查询单条数据
	public Assess queryAssessById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Assess assess);

}

