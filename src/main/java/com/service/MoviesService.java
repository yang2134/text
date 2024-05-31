package com.service;
import java.util.List;

import com.model.Movies;
import com.util.PageBean;

public interface MoviesService{
	
	//查询多条记录
	public List<Movies> queryMoviesList(Movies movies,PageBean page) throws Exception;
 
	//添加
	public int insertMovies(Movies movies) throws Exception ;
	
	//根据ID删除
	public int deleteMovies(int id) throws Exception ;
	
	//更新
	public int updateMovies(Movies movies) throws Exception ;
	
	//根据ID查询单条数据
	public Movies queryMoviesById(int id) throws Exception ;
	
	//得到记录总数
	int getCount(Movies movies);

}

