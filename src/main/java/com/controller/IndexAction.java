package com.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.*;
import com.service.MembersService;
import com.service.MtypeService;
import com.service.MoviesService;
import com.service.NewsService;
import com.service.AssessService;
import com.service.CollectsService;
import com.service.RoomsService;
import com.service.SeatsService;
import com.service.PlansService;
import com.service.OrdersService;
import com.service.OmoreService;

import com.util.*;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class IndexAction {
	
	@Autowired
private MembersService membersService;

@Autowired
private MtypeService mtypeService;

@Autowired
private MoviesService moviesService;

@Autowired
private NewsService newsService;

@Autowired
private AssessService assessService;

@Autowired
private CollectsService collectsService;

@Autowired
private RoomsService roomsService;

@Autowired
private SeatsService seatsService;

@Autowired
private PlansService plansService;

@Autowired
private OrdersService ordersService;

@Autowired
private OmoreService omoreService;



	@RequestMapping(value = "/")
	public String index(HttpServletRequest req) throws Exception {
		return "/login.jsp";
	}
    
	    //首页
 	@RequestMapping(value="/Index_List")
 	@ResponseBody
 	public ResData Index_List(HttpServletRequest req)throws Exception{ 	
 		ResData res= new ResData();
 		 		

 		
 		return res;
 	}



	
	//添加用户
	@RequestMapping(value="/members_Add")
	@ResponseBody
	public String members_Add(Members members,HttpServletRequest req)throws Exception{

		String msg="";
		Members m = new Members();
		m.setMname(members.getMname());
		m.setPhoto(members.getPhoto());

		List<Members> list = membersService.queryMembersList(m, null);
		if(list.size() > 0) {
			msg=list.get(0).getMeid().toString();
		}
		else
		{
			membersService.insertMembers(members);

			Integer mid=0;
			List<Members> list1 = membersService.queryMembersList(members, new PageBean(0,1));
			if(list1.size() > 0) {
				mid = list1.get(0).getMeid();
			}

			msg=mid.toString();
		}

		return msg;


    }

	
	//添加电影评论
	@RequestMapping(value="/assess_Add")
	@ResponseBody
	public void assess_Add(Assess assess,HttpServletRequest req)throws Exception{		
        assessService.insertAssess(assess);
    }

	
	//添加收藏夹
	@RequestMapping(value="/collects_Add")
	@ResponseBody
	public void collects_Add(Collects collects,HttpServletRequest req)throws Exception{		
        collectsService.insertCollects(collects);
    }

	
	//添加购票
	@RequestMapping(value="/orders_Add")
	@ResponseBody
	public void orders_Add(Orders orders,HttpServletRequest req)throws Exception{		
        ordersService.insertOrders(orders);

		Integer oid=0;
		List<Orders> list = ordersService.queryOrdersList(orders, new PageBean(0,1));
		if(list.size() > 0) {
			oid = list.get(0).getOid();
		}

		String[] seats = orders.getBy1().split(",");
		for (int i = 0; i < seats.length; i++) {
			Omore omore = new Omore();
			omore.setOid(oid);
			omore.setSid(Integer.parseInt(seats[i]));
			omore.setPid(orders.getPid());

			omoreService.insertOmore(omore);
		}
    }

    //修改用户
	@RequestMapping(value="/members_Edit")
	@ResponseBody
	public void members_Edit(Members members,HttpServletRequest req)throws Exception{		
		membersService.updateMembers(members); //修改用户
	}
    //修改电影评论
	@RequestMapping(value="/assess_Edit")
	@ResponseBody
	public void assess_Edit(Assess assess,HttpServletRequest req)throws Exception{		
		assessService.updateAssess(assess); //修改电影评论
	}
    //修改收藏夹
	@RequestMapping(value="/collects_Edit")
	@ResponseBody
	public void collects_Edit(Collects collects,HttpServletRequest req)throws Exception{		
		collectsService.updateCollects(collects); //修改收藏夹
	}
	
	//返回用户列表
	@RequestMapping(value="/members_List")
	@ResponseBody
	public ResData members_List(Members members,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Members> list = membersService.queryMembersList(members, null);	//查询用户列表	
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	
	//返回电影列表
	@RequestMapping(value="/movies_List")
	@ResponseBody
	public ResData movies_List(Movies movies,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Movies> list = moviesService.queryMoviesList(movies, null);	//查询电影列表

		String f = req.getParameter("f");

		if (f == null) {

		} else if (f.equals("2")) {
			Assess assess = new Assess();
			assess.setMid(movies.getMid());

			List<Assess> list1 = assessService.queryAssessList(assess, null);
			res.setData2(list1);

			Plans plans = new Plans();
			plans.setMid(movies.getMid());
			List<Plans> list2 = plansService.queryPlansList(plans, null);
			res.setData3(list2);

			String mid2=req.getParameter("mid2");
			Collects collects = new Collects();
			collects.setMid(movies.getMid());
			collects.setMeid(Integer.parseInt(mid2));
			List<Collects> list3 = collectsService.queryCollectsList(collects, null);

			if (list3.size() > 0) {
				res.setMsg("1");
			}
			else {
				res.setMsg("0");
			}

		}
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	
	//返回资讯列表
	@RequestMapping(value="/news_List")
	@ResponseBody
	public ResData news_List(News news,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<News> list = newsService.queryNewsList(news, null);	//查询资讯列表

		String f = req.getParameter("f");

		if (f == null) {

		} else if (f.equals("2")) {
			//遍历
			for (int i = 0; i < list.size(); i++) {
				News n = list.get(i);
				n.setMemo(removeHTML.processHtmlContent(n.getMemo()));
			}
		}
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	
	//返回放映计划列表
	@RequestMapping(value="/plans_List")
	@ResponseBody
	public ResData plans_List(Plans plans,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Plans> list = plansService.queryPlansList(plans, null);	//查询放映计划列表	
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	
	//返回购票列表
	@RequestMapping(value="/orders_List")
	@ResponseBody
	public ResData orders_List(Orders orders,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Orders> list = ordersService.queryOrdersList(orders, null);	//查询购票列表


		String f = req.getParameter("f");

		if (f == null) {

		} else if (f.equals("1")) {

			//遍历
			for (int i = 0; i < list.size(); i++) {
				Orders o = list.get(i);

				//得到当前时间 格式：yyyy-MM-dd HH:mm:ss
				String odate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				String rdate=o.getRdate();

				//判断日期是否过期
				if (odate.compareTo(rdate) > 0) {
					o.setBy2("0");
				}
				else {
					o.setBy2("1");
				}

			}
		}
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	//删除购票
	@RequestMapping(value="/orders_Del")
	@ResponseBody
	public void orders_Del(Orders orders,HttpServletRequest req)throws Exception{
		ordersService.deleteOrders(orders.getOid()); //删除购票
	}

	
	//返回影片分类列表
	@RequestMapping(value="/mtype_List")
	@ResponseBody
	public ResData mtype_List(Mtype mtype,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Mtype> list = mtypeService.queryMtypeList(mtype, null);	//查询影片分类列表

		String f = req.getParameter("f");

		if (f == null) {

		} else if (f.equals("1")) {
			Mtype m = new Mtype();
			m.setTname("全部");
			m.setTid(0);
			list.add(0, m);
		}
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	
	//返回电影评论列表
	@RequestMapping(value="/assess_List")
	@ResponseBody
	public ResData assess_List(Assess assess,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Assess> list = assessService.queryAssessList(assess, null);	//查询电影评论列表	
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	
	//返回放映厅列表
	@RequestMapping(value="/rooms_List")
	@ResponseBody
	public ResData rooms_List(Rooms rooms,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Rooms> list = roomsService.queryRoomsList(rooms, null);	//查询放映厅列表	
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	

	
	//返回收藏夹列表
	@RequestMapping(value="/collects_List")
	@ResponseBody
	public ResData collects_List(Collects collects,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Collects> list = collectsService.queryCollectsList(collects, null);	//查询收藏夹列表	
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	//删除收藏夹
	@RequestMapping(value="/collects_Del")
	@ResponseBody
	public void collects_Del(Collects collects,HttpServletRequest req)throws Exception{
		collectsService.deleteCollects(collects.getCid()); //删除收藏夹
	}

	
	//返回订单详情列表
	@RequestMapping(value="/omore_List")
	@ResponseBody
	public ResData omore_List(Omore omore,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Omore> list = omoreService.queryOmoreList(omore, null);	//查询订单详情列表	
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }

	
	//返回座位列表
	@RequestMapping(value="/seats_List")
	@ResponseBody
	public ResData seats_List(Seats seats,HttpServletRequest req)throws Exception{
	    ResData res = new ResData();	    
	    List<Seats> list = seatsService.querySeatsList(seats, null);	//查询座位列表	
        	    		
        res.setData(list);    //返回数据            		
        return res;
    }




	@RequestMapping(value = "/uploadFile")
	@ResponseBody
	public String uploadFile(@RequestParam MultipartFile[] file, String id, HttpServletRequest request) throws Exception {

		String[] path = uploadFile.uploadfile(file, request);
		return "/upload/" + path[0];
	}
}


