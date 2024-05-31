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
            <form  action="<%=path %>/plansEdit.action" method="post"  id="form1">
    <table style="width: 100%;" id="show_tab">
        
<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>影片:</td><td>
<select name="mid" style="width:200px">
<c:forEach items="${moviesList}" var="movies" varStatus="status" >
<option value="${movies.mid}"   <c:if test="${movies.mid==plans.mid}"> selected="selected"</c:if> >${movies.title}</option>
</c:forEach>
</select>

 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>放映厅:</td><td>
<select name="rid" style="width:200px">
<c:forEach items="${roomsList}" var="rooms" varStatus="status" >
<option value="${rooms.rid}"   <c:if test="${rooms.rid==plans.rid}"> selected="selected"</c:if> >${rooms.rname}</option>
</c:forEach>
</select>

 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>时间:</td><td>
<input name="ptime" type="text" id="ptime" style="width: 200px;" required  value='${plans.ptime}' />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>版本:</td><td>
<input name="banb" type="text" id="banb" style="width: 200px;" required  value='${plans.banb}' />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>价格:</td><td>
<input name="price" type="text" id="price" style="width: 200px;" required  value='${plans.price}' />
 </td></tr>


        <tr>
            <td>&nbsp;</td>
            <td align="left">
                <input name="pid" type="hidden"  value='<%= request.getParameter("id") %>'>
                <input type="submit" name="btnAdd" value="保 存"      class="btn btn-primary mb-2 mr-2 " />
                <input name="btnReturn" type="button" value="返 回"   class=" btn btn-success mb-2 mr-2"  onclick="history.go(-1);"  />
            </td>
        </tr>
    </table>
</form>



        </div>
    </div>
    

  </body>
</html>



