package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.CollectsMapper;
import com.model.Collects;
import com.util.PageBean;
@Service
public class CollectsServiceImpl implements CollectsService{
        
	@Autowired
	private CollectsMapper collectsMapper;

	//查询多条记录
	public List<Collects> queryCollectsList(Collects collects,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(collects, page);
		
		List<Collects> getCollects = collectsMapper.query(map);
		
		return getCollects;
	}
	
	//得到记录总数
	@Override
	public int getCount(Collects collects) {
		Map<String, Object> map = getQueryMap(collects, null);
		int count = collectsMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Collects collects,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(collects!=null){
			map.put("cid", collects.getCid());
			map.put("mid", collects.getMid());
			map.put("meid", collects.getMeid());
			map.put("atime", collects.getAtime());
			map.put("sort", collects.getSort());
			map.put("condition", collects.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertCollects(Collects collects) throws Exception {
		return collectsMapper.insertCollects(collects);
	}

	//根据ID删除
	public int deleteCollects(int id) throws Exception {
		return collectsMapper.deleteCollects(id);
	}

	//更新
	public int updateCollects(Collects collects) throws Exception {
		return collectsMapper.updateCollects(collects);
	}
	
	//根据ID得到对应的记录
	public Collects queryCollectsById(int id) throws Exception {
		Collects po =  collectsMapper.queryCollectsById(id);
		return po;
	}
}

