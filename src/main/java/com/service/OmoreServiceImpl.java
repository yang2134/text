package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.OmoreMapper;
import com.model.Omore;
import com.util.PageBean;
@Service
public class OmoreServiceImpl implements OmoreService{
        
	@Autowired
	private OmoreMapper omoreMapper;

	//查询多条记录
	public List<Omore> queryOmoreList(Omore omore,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(omore, page);
		
		List<Omore> getOmore = omoreMapper.query(map);
		
		return getOmore;
	}
	
	//得到记录总数
	@Override
	public int getCount(Omore omore) {
		Map<String, Object> map = getQueryMap(omore, null);
		int count = omoreMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Omore omore,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(omore!=null){
			map.put("id", omore.getId());
			map.put("oid", omore.getOid());
			map.put("sid", omore.getSid());
			map.put("pid", omore.getPid());
			map.put("sort", omore.getSort());
			map.put("condition", omore.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertOmore(Omore omore) throws Exception {
		return omoreMapper.insertOmore(omore);
	}

	//根据ID删除
	public int deleteOmore(int id) throws Exception {
		return omoreMapper.deleteOmore(id);
	}

	//更新
	public int updateOmore(Omore omore) throws Exception {
		return omoreMapper.updateOmore(omore);
	}
	
	//根据ID得到对应的记录
	public Omore queryOmoreById(int id) throws Exception {
		Omore po =  omoreMapper.queryOmoreById(id);
		return po;
	}
}

