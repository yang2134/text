<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <jsp:include flush="true" page="${basePath}/admin/head.jsp"></jsp:include>     
 </head>
 
  <body>


        
     
       
        <div style="width: 100%; padding: 20px;line-height: 29px;" class="row">
        <div style="width: 100%; padding: 20px;line-height: 29px;">
            
    <table style="width: 100%;" id="show_tab">
               <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
订单编号:</td><td>${orders.oid} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
影片:</td><td>${orders.title} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
放映厅:</td><td>${orders.rname} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
日期:</td><td>${orders.rdate} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
数量:</td><td>${orders.quan} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
总金额:</td><td>${orders.smoney} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
用户id:</td><td>${orders.meid} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
购票时间:</td><td>${orders.atime} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
座位:</td><td>${orders.ostext} </td></tr>


        <tr>
            <td>&nbsp;</td>
            <td align="left">          
                <input name="btnReturn" type="button" value="返 回"   class="btn btn-primary mb-2 mr-2 "  onclick="history.go(-1);"  />
            </td>
        </tr>
    </table>


        </div>
    </div>
    

  </body>
</html>



