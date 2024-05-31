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
            <form action="<%=path %>/moviesList.action" method="post">
<strong> 影片分类:</strong>
<select name="tid" style="width:150px">
<option value="">请选择影片分类</option>
<c:forEach items="${mtypeList}" var="mtype" varStatus="status" >
<option value="${mtype.tid}"    >${mtype.tname}</option>
</c:forEach>
</select>

<strong> 电影名称:</strong><input name="title" type="text" id="title" style="width: 150px;"  />
<strong> 导演:</strong><input name="daoy" type="text" id="daoy" style="width: 150px;"  />

<input name="search" type="submit" border="0" class="btn btn-primary mb-2 mr-2 "	value='搜索' />
</form>

        </td>
    </tr>
    <tr>
        <td>
            <pg:pager  url="moviesList.action" items="${itemSize}" maxPageItems="${pageItem}"
                       maxIndexPages="${pageItem}" isOffset="${true}" export = "offset,currentPageNumber=pageNumber"  scope ="request" >
            
    <table style="width:100%;text-align: center" id="show_tab">
        <thead>
        <tr>
        <td >影片分类</td>
        <td >电影名称</td>
        <td >图片</td>
        <td >导演</td>
        <td >主演</td>
        <td >时长</td>
        <td >发布时间</td>
        <td>操作</td>
</tr>

        </thead>
        <tbody>
        <c:forEach items="${moviesList}" var="movies" varStatus="status" >
        <tr>
        <td>${movies.tname}</td>
        <td>${movies.title}</td>
        <td><img  src="<%=path %>/${movies.pic}" width="80"  height="80" /></td>
        <td>${movies.daoy}</td>
        <td>${movies.zhuy}</td>
        <td>${movies.shic}</td>
        <td>${movies.matime}</td>
<td>
        <a href="<%=path %>/tomoviesView.action?id=${movies.mid}" class="cu-tag bg-cyan light "><i class="glyphicon glyphicon-zoom-in"></i>详细</a>&nbsp;
        <a href="<%=path %>/tomoviesEdit.action?id=${movies.mid}" class="cu-tag bg-green light "><i class="glyphicon glyphicon-pencil"></i>编辑</a>&nbsp;
<a href="javascript:void(0)" onclick="showMsg3('<%=path%>/moviesDel.action','${movies.mid}')" class="cu-tag bg-red light "><i class="glyphicon glyphicon-remove"></i>删除</a>&nbsp;
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



