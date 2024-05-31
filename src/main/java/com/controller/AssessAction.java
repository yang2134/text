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

import com.model.Assess;
import com.service.AssessService;
import com.model.Movies;
import com.service.MoviesService;

import com.util.*;
@Controller
public class AssessAction{
	
	@Autowired
	private AssessService assessService;
	
	@Autowired
	private MoviesService moviesService;

	//查询所有电影评论
	@RequestMapping(value="/assessList")
	public String assessList(Assess ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=assessService.getCount(ser);
		List<Assess> assessList=assessService.queryAssessList(ser, page);
		
		req.setAttribute("assessList", assessList);
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));

		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/assess/assess_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/assessToAdd")
	public String assessToAdd(HttpServletRequest req)throws Exception {
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));

		return "/admin/assess/assess_Add.jsp";
	}
		
	//添加电影评论
	@RequestMapping(value="/assessAdd")
	public String assessAdd(Assess assess,HttpServletRequest req)throws Exception{
		assessService.insertAssess(assess);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","assessToAdd.action");
		return "common/succeed.jsp";
	}

	//删除电影评论
	@RequestMapping(value="/assessDel")
	public String assessDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		assessService.deleteAssess(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","assessList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/toassessEdit")
	public String toassessEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Assess assess=assessService.queryAssessById(id);
		req.setAttribute("assess", assess);
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));

		return "/admin/assess/assess_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/toassessView")
	public String toassessView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Assess assess=assessService.queryAssessById(id);
		req.setAttribute("assess", assess);
		return "/admin/assess/assess_View.jsp";
	}
	
	//修改电影评论
	@RequestMapping(value="/assessEdit")
	public String assessEdit(Assess assess,HttpServletRequest req)throws Exception{
			
		assessService.updateAssess(assess);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","assessList.action");
		return "common/succeed.jsp";
	}
			
}

