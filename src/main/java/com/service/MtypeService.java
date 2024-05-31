package com.service;
import java.util.List;

import com.model.Mtype;
import com.util.PageBean;

public interface MtypeService{
	
	//查询多条记录
	public List<Mtype> queryMtypeList(Mtype mtype,PageBean page) throws Exception;
 
	//添加
	public int insertMtype(Mtype mtype) throws Exception ;
	
	//根据ID删除
	public int deleteMtype(int id) throws Exception ;
	
	//更新
	public int updateMtype(Mtype mtype) throws Exception ;
	
	//根据ID查询单条数据
	public Mtype queryMtypeById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Mtype mtype);

}

