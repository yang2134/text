package com.controller;

import com.model.ReportData;
import com.model.ResData;
import com.service.ReportDataService;
import com.util.PageBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class ReportDataAction {

	@Autowired
	private ReportDataService reportDataService;

	//查询报表
	@RequestMapping(value="/queryReport")
	@ResponseBody
	public void queryReport(ReportData reportdata, HttpServletRequest req, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "GET,POST");
		PrintWriter out = response.getWriter();
		JSONArray jsonarray = new JSONArray();
		JSONObject jsonobj = new JSONObject();
		JSONObject jsonobj2 = new JSONObject();

		ResData resData = new ResData();

		String rid=req.getParameter("rid");
		String pid=req.getParameter("pid");
		String d=req.getParameter("rdate");

		reportdata.setSql("select a.sid as name,a.rid as by1,pai as by2,hao as by3 ,o2.quan as num " +
				"from  seats a left join omore o on a.sid = o.sid and o.pid="+pid+
				" left join orders o2 on o.oid = o2.oid and o2.rdate='"+d+"' " +
				"  where a.rid="+rid+"  order by a.sid  ");
		List<ReportData> getReportData = reportDataService.report(reportdata);

		int k=1,t=0;
		for(ReportData rs : getReportData){

			jsonobj.put("sid", rs.getName());
			jsonobj.put("rid", rs.getBy1());
			jsonobj.put("pai", rs.getBy2());
			jsonobj.put("hao", rs.getBy3());
			jsonobj.put("pid", rs.getNum());
			if(k==Integer.parseInt(rs.getBy2()))
			{
				t++;
			}

			jsonarray.add(jsonobj);



		}
		jsonobj2.put("total",t);
		jsonobj2.element("val",jsonarray);

		out.println(jsonobj2);
		out.flush();
		out.close();

	}

}

