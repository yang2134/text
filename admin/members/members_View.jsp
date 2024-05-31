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
ID:</td><td>${members.meid} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
微信昵称:</td><td>${members.mname} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
头像:</td><td><img src='${members.photo}' style="width: 100px;height: 100px" />
 </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
姓名:</td><td>${members.sname} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
手机号码:</td><td>${members.tel} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
联系地址:</td><td>${members.address} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
QQ:</td><td>${members.qq} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
电子邮箱:</td><td>${members.email} </td></tr>

            <tr><td  style="text-align:right; width:20%;    padding-right: 15px; ">
注册时间:</td><td>${members.matime} </td></tr>


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



