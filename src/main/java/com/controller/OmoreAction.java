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

import com.model.Omore;
import com.service.OmoreService;

import com.util.*;
@Controller
public class OmoreAction{
	
	@Autowired
	private OmoreService omoreService;
	
	//查询所有订单详情
	@RequestMapping(value="/omoreList")
	public String omoreList(Omore ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=omoreService.getCount(ser);
		List<Omore> omoreList=omoreService.queryOmoreList(ser, page);
		
		req.setAttribute("omoreList", omoreList);
		
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/omore/omore_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/omoreToAdd")
	public String omoreToAdd(HttpServletRequest req)throws Exception {
		
		return "/admin/omore/omore_Add.jsp";
	}
		
	//添加订单详情
	@RequestMapping(value="/omoreAdd")
	public String omoreAdd(Omore omore,HttpServletRequest req)throws Exception{
		omoreService.insertOmore(omore);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","omoreToAdd.action");
		return "common/succeed.jsp";
	}

	//删除订单详情
	@RequestMapping(value="/omoreDel")
	public String omoreDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		omoreService.deleteOmore(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","omoreList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/toomoreEdit")
	public String toomoreEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Omore omore=omoreService.queryOmoreById(id);
		req.setAttribute("omore", omore);
		
		return "/admin/omore/omore_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/toomoreView")
	public String toomoreView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Omore omore=omoreService.queryOmoreById(id);
		req.setAttribute("omore", omore);
		return "/admin/omore/omore_View.jsp";
	}
	
	//修改订单详情
	@RequestMapping(value="/omoreEdit")
	public String omoreEdit(Omore omore,HttpServletRequest req)throws Exception{
			
		omoreService.updateOmore(omore);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","omoreList.action");
		return "common/succeed.jsp";
	}
			
}

