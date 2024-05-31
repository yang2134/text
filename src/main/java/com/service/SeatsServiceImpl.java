package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.SeatsMapper;
import com.model.Seats;
import com.util.PageBean;
@Service
public class SeatsServiceImpl implements SeatsService{
        
	@Autowired
	private SeatsMapper seatsMapper;

	//查询多条记录
	public List<Seats> querySeatsList(Seats seats,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(seats, page);
		
		List<Seats> getSeats = seatsMapper.query(map);
		
		return getSeats;
	}
	
	//得到记录总数
	@Override
	public int getCount(Seats seats) {
		Map<String, Object> map = getQueryMap(seats, null);
		int count = seatsMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Seats seats,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(seats!=null){
			map.put("sid", seats.getSid());
			map.put("rid", seats.getRid());
			map.put("pai", seats.getPai());
			map.put("hao", seats.getHao());
			map.put("sort", seats.getSort());
			map.put("condition", seats.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertSeats(Seats seats) throws Exception {
		return seatsMapper.insertSeats(seats);
	}

	//根据ID删除
	public int deleteSeats(int id) throws Exception {
		return seatsMapper.deleteSeats(id);
	}

	//更新
	public int updateSeats(Seats seats) throws Exception {
		return seatsMapper.updateSeats(seats);
	}
	
	//根据ID得到对应的记录
	public Seats querySeatsById(int id) throws Exception {
		Seats po =  seatsMapper.querySeatsById(id);
		return po;
	}
}

