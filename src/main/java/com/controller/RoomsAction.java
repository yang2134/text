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

import com.model.Rooms;
import com.service.RoomsService;

import com.util.*;
@Controller
public class RoomsAction{
	
	@Autowired
	private RoomsService roomsService;
	
	//查询所有放映厅
	@RequestMapping(value="/roomsList")
	public String roomsList(Rooms ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=roomsService.getCount(ser);
		List<Rooms> roomsList=roomsService.queryRoomsList(ser, page);
		
		req.setAttribute("roomsList", roomsList);
		
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/rooms/rooms_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/roomsToAdd")
	public String roomsToAdd(HttpServletRequest req)throws Exception {
		
		return "/admin/rooms/rooms_Add.jsp";
	}
		
	//添加放映厅
	@RequestMapping(value="/roomsAdd")
	public String roomsAdd(Rooms rooms,HttpServletRequest req)throws Exception{
		Rooms ro=new Rooms();
		ro.setRname(rooms.getRname());
    
		List<Rooms> list = roomsService.queryRoomsList(ro, null);
    
		if(list!=null&&list.size()>0){
			req.setAttribute("alert","该放映厅名称已存在，请重新输入");
			}else {
			roomsService.insertRooms(rooms);
			req.setAttribute("message","操作成功");
			req.setAttribute("path","roomsToAdd.action");
		}
		return "common/succeed.jsp";
	}

	//删除放映厅
	@RequestMapping(value="/roomsDel")
	public String roomsDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		roomsService.deleteRooms(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","roomsList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/toroomsEdit")
	public String toroomsEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Rooms rooms=roomsService.queryRoomsById(id);
		req.setAttribute("rooms", rooms);
		
		return "/admin/rooms/rooms_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/toroomsView")
	public String toroomsView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Rooms rooms=roomsService.queryRoomsById(id);
		req.setAttribute("rooms", rooms);
		return "/admin/rooms/rooms_View.jsp";
	}
	
	//修改放映厅
	@RequestMapping(value="/roomsEdit")
	public String roomsEdit(Rooms rooms,HttpServletRequest req)throws Exception{
			
		roomsService.updateRooms(rooms);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","roomsList.action");
		return "common/succeed.jsp";
	}
			
}

