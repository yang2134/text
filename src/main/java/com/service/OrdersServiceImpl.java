package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.OrdersMapper;
import com.model.Orders;
import com.util.PageBean;
@Service
public class OrdersServiceImpl implements OrdersService{
        
	@Autowired
	private OrdersMapper ordersMapper;

	//查询多条记录
	public List<Orders> queryOrdersList(Orders orders,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(orders, page);
		
		List<Orders> getOrders = ordersMapper.query(map);
		
		return getOrders;
	}
	
	//得到记录总数
	@Override
	public int getCount(Orders orders) {
		Map<String, Object> map = getQueryMap(orders, null);
		int count = ordersMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Orders orders,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(orders!=null){
			map.put("oid", orders.getOid());
			map.put("mid", orders.getMid());
			map.put("rid", orders.getRid());
			map.put("rdate", orders.getRdate());
			map.put("quan", orders.getQuan());
			map.put("smoney", orders.getSmoney());
			map.put("meid", orders.getMeid());
			map.put("atime", orders.getAtime());
			map.put("ostext", orders.getOstext());
			map.put("pid", orders.getPid());
			map.put("sort", orders.getSort());
			map.put("condition", orders.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertOrders(Orders orders) throws Exception {
		return ordersMapper.insertOrders(orders);
	}

	//根据ID删除
	public int deleteOrders(int id) throws Exception {
		return ordersMapper.deleteOrders(id);
	}

	//更新
	public int updateOrders(Orders orders) throws Exception {
		return ordersMapper.updateOrders(orders);
	}
	
	//根据ID得到对应的记录
	public Orders queryOrdersById(int id) throws Exception {
		Orders po =  ordersMapper.queryOrdersById(id);
		return po;
	}
}

