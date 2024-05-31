<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"  %> 
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
            <table style="width: 100%;text-align: center">
    <tr>
        <td>
            <form action="<%=path %>/ordersList.action" method="post">
<strong> 影片:</strong>
<select name="mid" style="width:150px">
<option value="">请选择影片</option>
<c:forEach items="${moviesList}" var="movies" varStatus="status" >
<option value="${movies.mid}"    >${movies.title}</option>
</c:forEach>
</select>

<strong> 放映厅:</strong>
<select name="rid" style="width:150px">
<option value="">请选择放映厅</option>
<c:forEach items="${roomsList}" var="rooms" varStatus="status" >
<option value="${rooms.rid}"    >${rooms.rname}</option>
</c:forEach>
</select>


<input name="search" type="submit" border="0" class="btn btn-primary mb-2 mr-2 "	value='搜索' />
</form>

        </td>
    </tr>
    <tr>
        <td>
            <pg:pager  url="ordersList.action" items="${itemSize}" maxPageItems="${pageItem}"
                       maxIndexPages="${pageItem}" isOffset="${true}" export = "offset,currentPageNumber=pageNumber"  scope ="request" >
            
    <table style="width:100%;text-align: center" id="show_tab">
        <thead>
        <tr>
        <td >影片</td>
        <td >放映厅</td>
        <td >日期</td>
        <td >数量</td>
        <td >总金额</td>
        <td >用户id</td>
        <td >购票时间</td>
        <td >座位</td>
        <td>操作</td>
</tr>

        </thead>
        <tbody>
        <c:forEach items="${ordersList}" var="orders" varStatus="status" >
        <tr>
        <td>${orders.title}</td>
        <td>${orders.rname}</td>
        <td>${orders.rdate}</td>
        <td>${orders.quan}</td>
        <td>${orders.smoney}</td>
        <td>${orders.meid}</td>
        <td>${orders.atime}</td>
        <td>${orders.ostext}</td>
<td>
        <a href="<%=path %>/toordersView.action?id=${orders.oid}" class="cu-tag bg-cyan light "><i class="glyphicon glyphicon-zoom-in"></i>详细</a>&nbsp;
<a href="javascript:void(0)" onclick="showMsg3('<%=path%>/ordersDel.action','${orders.oid}')" class="cu-tag bg-red light "><i class="glyphicon glyphicon-remove"></i>删除</a>&nbsp;
        </td>
        </tr>

        </c:forEach>
        </tbody>
    </table>





        </td>
    </tr>
    <tr>
        <td>
            <pg:index>	<jsp:include page="/common/pagination_tag.jsp" flush="true" />	</pg:index>	</pg:pager>
        </td>
    </tr>
</table>




        </div>
    </div>
    

  </body>
</html>



