package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.MoviesMapper;
import com.model.Movies;
import com.util.PageBean;
@Service
public class MoviesServiceImpl implements MoviesService{
        
	@Autowired
	private MoviesMapper moviesMapper;

	//查询多条记录
	public List<Movies> queryMoviesList(Movies movies,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(movies, page);
		
		List<Movies> getMovies = moviesMapper.query(map);
		
		return getMovies;
	}
	
	//得到记录总数
	@Override
	public int getCount(Movies movies) {
		Map<String, Object> map = getQueryMap(movies, null);
		int count = moviesMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Movies movies,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(movies!=null){
			map.put("mid", movies.getMid());
			map.put("tid", movies.getTid());
			map.put("title", movies.getTitle());
			map.put("pic", movies.getPic());
			map.put("daoy", movies.getDaoy());
			map.put("zhuy", movies.getZhuy());
			map.put("shic", movies.getShic());
			map.put("memo", movies.getMemo());
			map.put("matime", movies.getMatime());
			map.put("sort", movies.getSort());
			map.put("condition", movies.getCondition());

		}
		PageBean.setPageMap(map, page);
		return map;
	}
		
	//添加
	public int insertMovies(Movies movies) throws Exception {
		return moviesMapper.insertMovies(movies);
	}

	//根据ID删除
	public int deleteMovies(int id) throws Exception {
		return moviesMapper.deleteMovies(id);
	}

	//更新
	public int updateMovies(Movies movies) throws Exception {
		return moviesMapper.updateMovies(movies);
	}
	
	//根据ID得到对应的记录
	public Movies queryMoviesById(int id) throws Exception {
		Movies po =  moviesMapper.queryMoviesById(id);
		return po;
	}
}

