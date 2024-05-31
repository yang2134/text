package com.service;
import java.util.List;

import com.model.Seats;
import com.util.PageBean;

public interface SeatsService{
	
	//查询多条记录
	public List<Seats> querySeatsList(Seats seats,PageBean page) throws Exception;
 
	//添加
	public int insertSeats(Seats seats) throws Exception ;
	
	//根据ID删除
	public int deleteSeats(int id) throws Exception ;
	
	//更新
	public int updateSeats(Seats seats) throws Exception ;
	
	//根据ID查询单条数据
	public Seats querySeatsById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Seats seats);

}

