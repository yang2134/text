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
            <form action="<%=path %>/assessList.action" method="post">
<strong> 电影:</strong>
<select name="mid" style="width:150px">
<option value="">请选择电影</option>
<c:forEach items="${moviesList}" var="movies" varStatus="status" >
<option value="${movies.mid}"    >${movies.title}</option>
</c:forEach>
</select>


<input name="search" type="submit" border="0" class="btn btn-primary mb-2 mr-2 "	value='搜索' />
</form>

        </td>
    </tr>
    <tr>
        <td>
            <pg:pager  url="assessList.action" items="${itemSize}" maxPageItems="${pageItem}"
                       maxIndexPages="${pageItem}" isOffset="${true}" export = "offset,currentPageNumber=pageNumber"  scope ="request" >
            
    <table style="width:100%;text-align: center" id="show_tab">
        <thead>
        <tr>
        <td >电影</td>
        <td >用户id</td>
        <td >评分</td>
        <td >评语</td>
        <td >评论时间</td>
        <td>操作</td>
</tr>

        </thead>
        <tbody>
        <c:forEach items="${assessList}" var="assess" varStatus="status" >
        <tr>
        <td>${assess.title}</td>
        <td>${assess.meid}</td>
        <td>${assess.ascore}</td>
        <td>${fn:substring(assess.amemo, 0, 15)}</td>
        <td>${assess.atime}</td>
<td>
        <a href="<%=path %>/toassessView.action?id=${assess.aid}" class="cu-tag bg-cyan light "><i class="glyphicon glyphicon-zoom-in"></i>详细</a>&nbsp;
<a href="javascript:void(0)" onclick="showMsg3('<%=path%>/assessDel.action','${assess.aid}')" class="cu-tag bg-red light "><i class="glyphicon glyphicon-remove"></i>删除</a>&nbsp;
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



