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

import com.model.Seats;
import com.service.SeatsService;
import com.model.Rooms;
import com.service.RoomsService;

import com.util.*;
@Controller
public class SeatsAction{
	
	@Autowired
	private SeatsService seatsService;
	
	@Autowired
	private RoomsService roomsService;

	//查询所有座位
	@RequestMapping(value="/seatsList")
	public String seatsList(Seats ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=seatsService.getCount(ser);
		List<Seats> seatsList=seatsService.querySeatsList(ser, page);
		
		req.setAttribute("seatsList", seatsList);
		
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/seats/seats_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/seatsToAdd")
	public String seatsToAdd(HttpServletRequest req)throws Exception {
		
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		return "/admin/seats/seats_Add.jsp";
	}
		
	//添加座位
	@RequestMapping(value="/seatsAdd")
	public String seatsAdd(Seats seats,HttpServletRequest req)throws Exception{
		seatsService.insertSeats(seats);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","seatsToAdd.action");
		return "common/succeed.jsp";
	}

	//删除座位
	@RequestMapping(value="/seatsDel")
	public String seatsDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		seatsService.deleteSeats(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","seatsList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/toseatsEdit")
	public String toseatsEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Seats seats=seatsService.querySeatsById(id);
		req.setAttribute("seats", seats);
		
		req.setAttribute("roomsList", roomsService.queryRoomsList(null,null));

		return "/admin/seats/seats_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/toseatsView")
	public String toseatsView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Seats seats=seatsService.querySeatsById(id);
		req.setAttribute("seats", seats);
		return "/admin/seats/seats_View.jsp";
	}
	
	//修改座位
	@RequestMapping(value="/seatsEdit")
	public String seatsEdit(Seats seats,HttpServletRequest req)throws Exception{
			
		seatsService.updateSeats(seats);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","seatsList.action");
		return "common/succeed.jsp";
	}
			
}

