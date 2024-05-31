package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PlansMapper;
import com.model.Plans;
import com.util.PageBean;
@Service
public class PlansServiceImpl implements PlansService{
        
	@Autowired
	private PlansMapper plansMapper;

	//查询多条记录
	public List<Plans> queryPlansList(Plans plans,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(plans, page);
		
		List<Plans> getPlans = plansMapper.query(map);
		
		return getPlans;
	}
	
	//得到记录总数
	@Override
	public int getCount(Plans plans) {
		Map<String, Object> map = getQueryMap(plans, null);
		int count = plansMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Plans plans,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(plans!=null){
			map.put("pid", plans.getPid());
			map.put("mid", plans.getMid());
			map.put("rid", plans.getRid());
			map.put("ptime", plans.getPtime());
			map.put("banb", plans.getBanb());
			map.put("price", plans.getPrice());
			map.put("sort", plans.getSort());
			map.put("condition", plans.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertPlans(Plans plans) throws Exception {
		return plansMapper.insertPlans(plans);
	}

	//根据ID删除
	public int deletePlans(int id) throws Exception {
		return plansMapper.deletePlans(id);
	}

	//更新
	public int updatePlans(Plans plans) throws Exception {
		return plansMapper.updatePlans(plans);
	}
	
	//根据ID得到对应的记录
	public Plans queryPlansById(int id) throws Exception {
		Plans po =  plansMapper.queryPlansById(id);
		return po;
	}
}

