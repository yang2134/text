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

import com.model.Orders;
import com.service.OrdersService;
import com.model.Movies;
import com.service.MoviesService;
import com.model.Rooms;
import com.service.RoomsService;

import com.util.*;
@Controller
public class OrdersAction{
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private MoviesService moviesService;
	@Autowired
	private RoomsService roomsService;

	//查询所有购票
	@RequestMapping(value="/ordersList")
	public String ordersList(Orders ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=ordersService.getCount(ser);
		List<Orders> ordersList=ordersService.queryOrdersList(ser, page);
		
		req.setAttribute("ordersList", ordersList);
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/orders/orders_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/ordersToAdd")
	public String ordersToAdd(HttpServletRequest req)throws Exception {
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		return "/admin/orders/orders_Add.jsp";
	}
		
	//添加购票
	@RequestMapping(value="/ordersAdd")
	public String ordersAdd(Orders orders,HttpServletRequest req)throws Exception{
		ordersService.insertOrders(orders);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","ordersToAdd.action");
		return "common/succeed.jsp";
	}

	//删除购票
	@RequestMapping(value="/ordersDel")
	public String ordersDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		ordersService.deleteOrders(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","ordersList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/toordersEdit")
	public String toordersEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Orders orders=ordersService.queryOrdersById(id);
		req.setAttribute("orders", orders);
		
		req.setAttribute("moviesList", moviesService.queryMoviesList(null,null));
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		return "/admin/orders/orders_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/toordersView")
	public String toordersView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Orders orders=ordersService.queryOrdersById(id);
		req.setAttribute("orders", orders);
		return "/admin/orders/orders_View.jsp";
	}
	
	//修改购票
	@RequestMapping(value="/ordersEdit")
	public String ordersEdit(Orders orders,HttpServletRequest req)throws Exception{
			
		ordersService.updateOrders(orders);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","ordersList.action");
		return "common/succeed.jsp";
	}
			
}

