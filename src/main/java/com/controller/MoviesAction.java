package com.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Movies;
import com.service.MoviesService;
import com.model.Mtype;
import com.service.MtypeService;

import com.util.*;
@Controller
public class MoviesAction{
	
	@Autowired
	private MoviesService moviesService;
	
	@Autowired
	private MtypeService mtypeService;

	//查询所有电影
	@RequestMapping(value="/moviesList")
	public String moviesList(Movies ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=moviesService.getCount(ser);
		List<Movies> moviesList=moviesService.queryMoviesList(ser, page);
		
		//遍历
		for (Movies movies : moviesList) {
			movies.setMemo(removeHTML.Html2Text(movies.getMemo()));

		}

		req.setAttribute("moviesList", moviesList);
		
		req.setAttribute("mtypeList", mtypeService.queryMtypeList(null,null));

		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/movies/movies_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/moviesToAdd")
	public String moviesToAdd(HttpServletRequest req)throws Exception {
		
		req.setAttribute("mtypeList", mtypeService.queryMtypeList(null,null));

		return "/admin/movies/movies_Add.jsp";
	}
		
	//添加电影
	@RequestMapping(value="/moviesAdd")
	public String moviesAdd(Movies movies,HttpServletRequest req)throws Exception{
		moviesService.insertMovies(movies);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","moviesToAdd.action");
		return "common/succeed.jsp";
	}

	//删除电影
	@RequestMapping(value="/moviesDel")
	public String moviesDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		moviesService.deleteMovies(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","moviesList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/tomoviesEdit")
	public String tomoviesEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Movies movies=moviesService.queryMoviesById(id);
		req.setAttribute("movies", movies);
		
		req.setAttribute("mtypeList", mtypeService.queryMtypeList(null,null));

		return "/admin/movies/movies_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/tomoviesView")
	public String tomoviesView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Movies movies=moviesService.queryMoviesById(id);
		req.setAttribute("movies", movies);
		return "/admin/movies/movies_View.jsp";
	}
	
	//修改电影
	@RequestMapping(value="/moviesEdit")
	public String moviesEdit(Movies movies,HttpServletRequest req)throws Exception{
			
		moviesService.updateMovies(movies);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","moviesList.action");
		return "common/succeed.jsp";
	}
			
}

