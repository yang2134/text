package com.service;
import java.util.List;

import com.model.Rooms;
import com.util.PageBean;

public interface RoomsService{
	
	//查询多条记录
	public List<Rooms> queryRoomsList(Rooms rooms,PageBean page) throws Exception;
 
	//添加
	public int insertRooms(Rooms rooms) throws Exception ;
	
	//根据ID删除
	public int deleteRooms(int id) throws Exception ;
	
	//更新
	public int updateRooms(Rooms rooms) throws Exception ;
	
	//根据ID查询单条数据
	public Rooms queryRoomsById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Rooms rooms);

}

