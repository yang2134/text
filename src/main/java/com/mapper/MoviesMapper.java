package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Movies;

public interface MoviesMapper {

	//返回所有记录
	public List<Movies> findMoviesList();
	
	//查询多条记录
	public List<Movies> query(Map<String,Object> inputParam);
	
	//得到记录总数
	int getCount(Map<String,Object> inputParam);
	
	//添加
	public int insertMovies(Movies movies);

	//根据ID删除
	public int deleteMovies(int id);
	
	//更新
	public int updateMovies(Movies movies);
	
	//根据ID得到对应的记录
	public Movies queryMoviesById(int id);
	
}

