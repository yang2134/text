package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.RoomsMapper;
import com.model.Rooms;
import com.util.PageBean;
@Service
public class RoomsServiceImpl implements RoomsService{
        
	@Autowired
	private RoomsMapper roomsMapper;

	//查询多条记录
	public List<Rooms> queryRoomsList(Rooms rooms,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(rooms, page);
		
		List<Rooms> getRooms = roomsMapper.query(map);
		
		return getRooms;
	}
	
	//得到记录总数
	@Override
	public int getCount(Rooms rooms) {
		Map<String, Object> map = getQueryMap(rooms, null);
		int count = roomsMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Rooms rooms,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(rooms!=null){
			map.put("rid", rooms.getRid());
			map.put("rname", rooms.getRname());
			map.put("sort", rooms.getSort());
			map.put("condition", rooms.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertRooms(Rooms rooms) throws Exception {
		return roomsMapper.insertRooms(rooms);
	}

	//根据ID删除
	public int deleteRooms(int id) throws Exception {
		return roomsMapper.deleteRooms(id);
	}

	//更新
	public int updateRooms(Rooms rooms) throws Exception {
		return roomsMapper.updateRooms(rooms);
	}
	
	//根据ID得到对应的记录
	public Rooms queryRoomsById(int id) throws Exception {
		Rooms po =  roomsMapper.queryRoomsById(id);
		return po;
	}
}

