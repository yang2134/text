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

import com.model.Plans;
import com.service.PlansService;
import com.model.Movies;
import com.service.MoviesService;
import com.model.Rooms;
import com.service.RoomsService;

import com.util.*;
@Controller
public class PlansAction{
	
	@Autowired
	private PlansService plansService;
	
	@Autowired
	private MoviesService moviesService;
	@Autowired
	private RoomsService roomsService;

	//查询所有放映计划
	@RequestMapping(value="/plansList")
	public String plansList(Plans ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=plansService.getCount(ser);
		List<Plans> plansList=plansService.queryPlansList(ser, page);
		
		req.setAttribute("plansList", plansList);
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/plans/plans_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/plansToAdd")
	public String plansToAdd(HttpServletRequest req)throws Exception {
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		return "/admin/plans/plans_Add.jsp";
	}
		
	//添加放映计划
	@RequestMapping(value="/plansAdd")
	public String plansAdd(Plans plans,HttpServletRequest req)throws Exception{
		plansService.insertPlans(plans);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","plansToAdd.action");
		return "common/succeed.jsp";
	}

	//删除放映计划
	@RequestMapping(value="/plansDel")
	public String plansDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		plansService.deletePlans(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","plansList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/toplansEdit")
	public String toplansEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Plans plans=plansService.queryPlansById(id);
		req.setAttribute("plans", plans);
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		return "/admin/plans/plans_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/toplansView")
	public String toplansView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Plans plans=plansService.queryPlansById(id);
		req.setAttribute("plans", plans);
		return "/admin/plans/plans_View.jsp";
	}
	
	//修改放映计划
	@RequestMapping(value="/plansEdit")
	public String plansEdit(Plans plans,HttpServletRequest req)throws Exception{
			
		plansService.updatePlans(plans);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","plansList.action");
		return "common/succeed.jsp";
	}
			
}

