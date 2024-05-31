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

import com.model.Collects;
import com.service.CollectsService;

import com.util.*;
@Controller
public class CollectsAction{
	
	@Autowired
	private CollectsService collectsService;
	
	//查询所有收藏夹
	@RequestMapping(value="/collectsList")
	public String collectsList(Collects ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=collectsService.getCount(ser);
		List<Collects> collectsList=collectsService.queryCollectsList(ser, page);
		
		req.setAttribute("collectsList", collectsList);
		
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/collects/collects_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/collectsToAdd")
	public String collectsToAdd(HttpServletRequest req)throws Exception {
		
		return "/admin/collects/collects_Add.jsp";
	}
		
	//添加收藏夹
	@RequestMapping(value="/collectsAdd")
	public String collectsAdd(Collects collects,HttpServletRequest req)throws Exception{
		collectsService.insertCollects(collects);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","collectsToAdd.action");
		return "common/succeed.jsp";
	}

	//删除收藏夹
	@RequestMapping(value="/collectsDel")
	public String collectsDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		collectsService.deleteCollects(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","collectsList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/tocollectsEdit")
	public String tocollectsEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Collects collects=collectsService.queryCollectsById(id);
		req.setAttribute("collects", collects);
		
		return "/admin/collects/collects_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/tocollectsView")
	public String tocollectsView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Collects collects=collectsService.queryCollectsById(id);
		req.setAttribute("collects", collects);
		return "/admin/collects/collects_View.jsp";
	}
	
	//修改收藏夹
	@RequestMapping(value="/collectsEdit")
	public String collectsEdit(Collects collects,HttpServletRequest req)throws Exception{
			
		collectsService.updateCollects(collects);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","collectsList.action");
		return "common/succeed.jsp";
	}
			
}

