package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.MtypeMapper;
import com.model.Mtype;
import com.util.PageBean;
@Service
public class MtypeServiceImpl implements MtypeService{
        
	@Autowired
	private MtypeMapper mtypeMapper;

	//查询多条记录
	public List<Mtype> queryMtypeList(Mtype mtype,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(mtype, page);
		
		List<Mtype> getMtype = mtypeMapper.query(map);
		
		return getMtype;
	}
	
	//得到记录总数
	@Override
	public int getCount(Mtype mtype) {
		Map<String, Object> map = getQueryMap(mtype, null);
		int count = mtypeMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Mtype mtype,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(mtype!=null){
			map.put("tid", mtype.getTid());
			map.put("tname", mtype.getTname());
			map.put("sort", mtype.getSort());
			map.put("condition", mtype.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertMtype(Mtype mtype) throws Exception {
		return mtypeMapper.insertMtype(mtype);
	}

	//根据ID删除
	public int deleteMtype(int id) throws Exception {
		return mtypeMapper.deleteMtype(id);
	}

	//更新
	public int updateMtype(Mtype mtype) throws Exception {
		return mtypeMapper.updateMtype(mtype);
	}
	
	//根据ID得到对应的记录
	public Mtype queryMtypeById(int id) throws Exception {
		Mtype po =  mtypeMapper.queryMtypeById(id);
		return po;
	}
}

