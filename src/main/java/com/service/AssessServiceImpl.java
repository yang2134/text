package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.AssessMapper;
import com.model.Assess;
import com.util.PageBean;
@Service
public class AssessServiceImpl implements AssessService{
        
	@Autowired
	private AssessMapper assessMapper;

	//查询多条记录
	public List<Assess> queryAssessList(Assess assess,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(assess, page);
		
		List<Assess> getAssess = assessMapper.query(map);
		
		return getAssess;
	}
	
	//得到记录总数
	@Override
	public int getCount(Assess assess) {
		Map<String, Object> map = getQueryMap(assess, null);
		int count = assessMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Assess assess,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(assess!=null){
			map.put("aid", assess.getAid());
			map.put("mid", assess.getMid());
			map.put("meid", assess.getMeid());
			map.put("ascore", assess.getAscore());
			map.put("amemo", assess.getAmemo());
			map.put("atime", assess.getAtime());
			map.put("sort", assess.getSort());
			map.put("condition", assess.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertAssess(Assess assess) throws Exception {
		return assessMapper.insertAssess(assess);
	}

	//根据ID删除
	public int deleteAssess(int id) throws Exception {
		return assessMapper.deleteAssess(id);
	}

	//更新
	public int updateAssess(Assess assess) throws Exception {
		return assessMapper.updateAssess(assess);
	}
	
	//根据ID得到对应的记录
	public Assess queryAssessById(int id) throws Exception {
		Assess po =  assessMapper.queryAssessById(id);
		return po;
	}
}

