package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Rooms;

public interface RoomsMapper {

	//返回所有记录
	public List<Rooms> findRoomsList();
	
	//查询多条记录
	public List<Rooms> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertRooms(Rooms rooms);

	//根据ID删除
	public int deleteRooms(int id);
	
	//更新
	public int updateRooms(Rooms rooms);
	
	//根据ID得到对应的记录
	public Rooms queryRoomsById(int id);
	
}

