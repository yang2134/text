package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Orders;

public interface OrdersMapper {

	//返回所有记录
	public List<Orders> findOrdersList();
	
	//查询多条记录
	public List<Orders> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertOrders(Orders orders);

	//根据ID删除
	public int deleteOrders(int id);
	
	//更新
	public int updateOrders(Orders orders);
	
	//根据ID得到对应的记录
	public Orders queryOrdersById(int id);
	
}

