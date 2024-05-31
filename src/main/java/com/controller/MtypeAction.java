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

import com.model.Mtype;
import com.service.MtypeService;

import com.util.*;
@Controller
public class MtypeAction{
	
	@Autowired
	private MtypeService mtypeService;
	
	//查询所有影片分类
	@RequestMapping(value="/mtypeList")
	public String mtypeList(Mtype ser,HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量，hibernate数据分页用到
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
			} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		
		counts=mtypeService.getCount(ser);
		List<Mtype> mtypeList=mtypeService.queryMtypeList(ser, page);
		
		req.setAttribute("mtypeList", mtypeList);
		
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/admin/mtype/mtype_Manage.jsp";
	}
	
	//跳转到添加页面
	@RequestMapping(value="/mtypeToAdd")
	public String mtypeToAdd(HttpServletRequest req)throws Exception {
		
		return "/admin/mtype/mtype_Add.jsp";
	}
		
	//添加影片分类
	@RequestMapping(value="/mtypeAdd")
	public String mtypeAdd(Mtype mtype,HttpServletRequest req)throws Exception{
		Mtype mt=new Mtype();
		mt.setTname(mtype.getTname());
    
		List<Mtype> list = mtypeService.queryMtypeList(mt, null);
    
		if(list!=null&&list.size()>0){
			req.setAttribute("alert","该分类名称已存在，请重新输入");
			}else {
			mtypeService.insertMtype(mtype);
			req.setAttribute("message","操作成功");
			req.setAttribute("path","mtypeToAdd.action");
		}
		return "common/succeed.jsp";
	}

	//删除影片分类
	@RequestMapping(value="/mtypeDel")
	public String mtypeDel(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		mtypeService.deleteMtype(id);
		req.setAttribute("message","操作成功");
		req.setAttribute("path","mtypeList.action");
		return "common/succeed.jsp";
	}
	
	//跳转到修改页面
	@RequestMapping(value="/tomtypeEdit")
	public String tomtypeEdit(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Mtype mtype=mtypeService.queryMtypeById(id);
		req.setAttribute("mtype", mtype);
		
		return "/admin/mtype/mtype_Edit.jsp";
	}
	
	//跳转到详情页面
	@RequestMapping(value="/tomtypeView")
	public String tomtypeView(HttpServletRequest req)throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		Mtype mtype=mtypeService.queryMtypeById(id);
		req.setAttribute("mtype", mtype);
		return "/admin/mtype/mtype_View.jsp";
	}
	
	//修改影片分类
	@RequestMapping(value="/mtypeEdit")
	public String mtypeEdit(Mtype mtype,HttpServletRequest req)throws Exception{
			
		mtypeService.updateMtype(mtype);
		
		req.setAttribute("message","操作成功");
		req.setAttribute("path","mtypeList.action");
		return "common/succeed.jsp";
	}
			
}

