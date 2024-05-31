package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Seats;

public interface SeatsMapper {

	//返回所有记录
	public List<Seats> findSeatsList();
	
	//查询多条记录
	public List<Seats> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertSeats(Seats seats);

	//根据ID删除
	public int deleteSeats(int id);
	
	//更新
	public int updateSeats(Seats seats);
	
	//根据ID得到对应的记录
	public Seats querySeatsById(int id);
	
}

