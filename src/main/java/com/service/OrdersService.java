package com.service;
import java.util.List;

import com.model.Orders;
import com.util.PageBean;

public interface OrdersService{
	
	//查询多条记录
	public List<Orders> queryOrdersList(Orders orders,PageBean page) throws Exception;
 
	//添加
	public int insertOrders(Orders orders) throws Exception ;
	
	//根据ID删除
	public int deleteOrders(int id) throws Exception ;
	
	//更新
	public int updateOrders(Orders orders) throws Exception ;
	
	//根据ID查询单条数据
	public Orders queryOrdersById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Orders orders);

}

